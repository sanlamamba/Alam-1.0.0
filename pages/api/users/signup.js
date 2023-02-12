import bcrypt from "bcrypt";
import { v4 as uuidv4 } from "uuid";
import jwt from "jsonwebtoken";
import isEmail from "validator/lib/isEmail";
import isLength from "validator/lib/isLength";

import User from "database/models/user";

import { confirmEmailAddress } from "email-templates/account-confirmation";

export default async function handler(req, res) {
  switch (req.method) {
    case "POST":
      await userSignup(req, res);
      break;
    default:
      res.status(405).json({
        message: `Method ${req.method} not allowed`,
      });
  }
}

const userSignup = async (req, res) => {
  const confirmToken = uuidv4();
  let { first_name, last_name, email, password } = req.body;
  try {
    if (!isLength(first_name, { min: 3 })) {
      return res.status(422).json({
        message: "Votre prénom est trop court",
      });
    } else if (!isLength(last_name, { min: 3 })) {
      return res.status(422).json({
        message: "Votre nom est trop court",
      });
    } else if (!isEmail(email)) {
      return res.status(422).json({ message: "Votre email est invalide" });
    } else if (!isLength(password, { min: 6 })) {
      return res.status(422).json({
        message: "Votre mot de passe est trop faible",
      });
    }

    // Check if user with that email if already exists
    const user = await User.findOne({
      where: { email: email },
    });

    if (user) {
      return res
        .status(422)
        .json({ message: `l'email :  ${email}, a deja un compte` });
    }

    // Encrypt password with bcrypt
    const passwordHash = await bcrypt.hash(password, 10);

    const newUser = await User.create({
      first_name,
      last_name,
      email,
      password: passwordHash,
      reset_password_token: confirmToken,
      reset_password_send_at: Date.now(),
    });

    confirmEmailAddress(newUser);

    const edmy_users_token = jwt.sign(
      {
        userId: newUser.id,
        first_name: newUser.first_name,
        last_name: newUser.last_name,
        email: newUser.email,
        role: newUser.role,
        profile_photo: newUser.profile_photo,
      },
      process.env.JWT_SECRET,
      {
        expiresIn: "7d",
      }
    );

    res.status(200).json({
      message: "Inscription reussie!",
      edmy_users_token,
    });
  } catch (e) {
    res.status(400).json({
      error_code: "create_user",
      message: e.message,
    });
  }
};
