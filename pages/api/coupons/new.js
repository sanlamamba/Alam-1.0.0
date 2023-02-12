import Coupon from "database/models/coupon";

export default async function handler(req, res) {
  if (!("authorization" in req.headers)) {
    return res.status(401).json({ message: "No autorization token" });
  }
  switch (req.method) {
    case "POST":
      await handlePostRequest(req, res);
      break;
    case "PUT":
      await handlePutRequest(req, res);
      break;
    default:
      res.status(405).json({
        message: `Method ${req.method} not allowed`,
      });
  }
}

const handlePostRequest = async (req, res) => {
  const { coupon, discount } = req.body;

  try {
    const couponExist = await Coupon.findOne({
      where: { code: coupon },
    });

    if (couponExist) {
      return res.status(422).json({
        message: "Cet Code Promo existe deja",
      });
    }

    if (!coupon) {
      return res.status(422).json({
        message: "Code Promo Invalide",
      });
    }

    if (discount == 0) {
      return res.status(422).json({
        message: "Pourcentage invalide",
      });
    }

    const newcoupon = await Coupon.create({
      code: coupon,
      discount: discount,
    });

    res.status(200).json({
      message: "Code Promo crée ",
      coupon: newcoupon,
    });
  } catch (e) {
    res.status(400).json({
      error_code: "create_coupon",
      message: e.message,
    });
  }
};

const handlePutRequest = async (req, res) => {
  const { couponId } = req.body;
  console.log(couponId);
  try {
    const coupons = await Coupon.findAll({ attributes: ["id"] });
    let couponIds = [];
    coupons.forEach((cp) => {
      couponIds.push(cp.id);
    });

    Coupon.update(
      { active_for_full_site: false },
      {
        where: {
          id: couponIds,
        },
      }
    );

    Coupon.update(
      { active_for_full_site: true },
      {
        where: {
          id: couponId,
        },
      }
    );

    res.status(200).json({
      message: "Code Promo activé pour tous les cours",
    });
  } catch (e) {
    res.status(400).json({
      error_code: "coupon_for_all_courses",
      message: e.message,
    });
  }
};
