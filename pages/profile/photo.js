import React, { useState } from "react";
import Navbar from "@/components/_App/Navbar";
import Footer from "@/components/_App/Footer";
import Link from "next/link";
import { parseCookies } from "nookies";
import axios from "axios";
import toast from "react-hot-toast";
import { useRouter } from "next/router";
import baseUrl from "@/utils/baseUrl";
import Button from "@/utils/Button";
import cloudinary from "@/utils/cloudinaryConfig";
const Photo = ({ user }) => {
  const { edmy_users_token } = parseCookies();
  const router = useRouter();
  const [avatar, setAvatar] = useState(user);
  const [loading, setLoading] = React.useState(false);
  const [profilePreview, setProfilePreview] = React.useState("");
  console.log(cloudinary);
  const handleChange = (e) => {
    const { files } = e.target;

    const profilePhotoSize = files[0].size / 1024 / 1024;
    if (profilePhotoSize > 2) {
      toast.error("L'image ne doit pas dépasser 2 Mo", {
        style: {
          border: "1px solid #ff0033",
          padding: "16px",
          color: "#ff0033",
        },
        iconTheme: {
          primary: "#ff0033",
          secondary: "#FFFAEE",
        },
      });
      e.target.value = null;
      return;
    }

    setAvatar({
      profile_photo: files[0],
    });
    setProfilePreview(window.URL.createObjectURL(files[0]));
  };

  const handleProfilePhotoUpload = async () => {
    // console.log(avatar);
    const data = new FormData();
    data.append("file", avatar.profile_photo);
    data.append("upload_preset", cloudinary.photo_preset);
    data.append("cloud_name", cloudinary.cloud_name);

    let response;
    if (avatar) {
      const cloudinary_url = `https://api.cloudinary.com/v1_1/${cloudinary.cloud_name}/image/upload`;
      response = await axios.post(cloudinary_url, data, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      });
    }
    const profilePhotoUrl = response.data.url;
    return profilePhotoUrl;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      // console.log(avatar);
      let profile = "";
      if (avatar) {
        profile = await handleProfilePhotoUpload();
        profile = profile.replace(/^http:\/\//i, "https://");
      }
      // console.log(profile);
      const url = `${baseUrl}/api/users/profile-photo`;
      const payload = {
        profile_photo: profile,
      };
      const response = await axios.put(url, payload, {
        headers: { Authorization: edmy_users_token },
      });
      setLoading(false);
      toast.success(response.data.message);
      router.push("/");
    } catch (err) {
      let {
        response: {
          data: { message },
        },
      } = err;
      toast.error(message, {
        style: {
          border: "1px solid #ff0033",
          padding: "16px",
          color: "#ff0033",
        },
        iconTheme: {
          primary: "#ff0033",
          secondary: "#FFFAEE",
        },
      });
    } finally {
      setLoading(false);
    }
  };

  return (
    <>
      <Navbar user={user} />

      <div className="ptb-100">
        <div className="container">
          <h2 className="fw-bold mb-4">Profile & Parametres</h2>

          <ul className="nav-style1">
            <li>
              <Link href="/profile/basic-information">
                <a>Profile</a>
              </Link>
            </li>
            <li>
              <Link href="/profile/photo">
                <a className="active">Photo de profile</a>
              </Link>
            </li>
          </ul>

          <div className="basic-profile-information-form">
            <form onSubmit={handleSubmit}>
              <div className="row">
                <div className="col-md-6">
                  <div className="form-group">
                    <label className="form-label fw-semibold">
                      Photo de profil
                    </label>
                    <input
                      type="file"
                      className="form-control file-control"
                      name="profilePhoto"
                      accept="image/*"
                      onChange={handleChange}
                      required={true}
                    />
                    <div className="form-text mt-2">
                      L'image devrais etre 200x200 pixels!
                    </div>

                    <div className="mt-3">
                      {profilePreview ? (
                        <img
                          src={profilePreview}
                          className="img-thumbnail mw-200px"
                        />
                      ) : (
                        <img
                          src="/images/avatar.jpg"
                          alt="image"
                          className="img-thumbnail mw-200px"
                        />
                      )}
                    </div>
                  </div>
                </div>

                <div className="col-12">
                  <Button
                    loading={loading}
                    btnText="Valider"
                    btnClass="btn default-btn"
                  />
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>

      <Footer />
    </>
  );
};

export default Photo;
