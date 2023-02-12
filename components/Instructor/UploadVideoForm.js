import React, { useEffect, useState } from "react";
import axios from "axios";
import { parseCookies } from "nookies";
import baseUrl from "@/utils/baseUrl";
import toast from "react-hot-toast";
import { useRouter } from "next/router";
import Button from "@/utils/Button";
import cloudinary from "@/utils/cloudinaryConfig";

const INITIAL_VALUE = {
  group_name: "",
  title: "",
  thumb: "",
  video: "",
  video_length: 0.0,
  is_preview: false,
  short_id: 0,
  courseId: "",
};

const UploadVideoForm = ({ courseId }) => {
  const { edmy_users_token } = parseCookies();
  const [video, setVideo] = useState(INITIAL_VALUE);
  const [disabled, setDisabled] = React.useState(true);
  const [loading, setLoading] = React.useState(false);
  const [thumbPreview, setThumbPreview] = React.useState("");
  const router = useRouter();
  const [uploadProgress, setUploadProgress] = useState({
    thumb: 0,
    video: 0,
  });

  useEffect(() => {
    setVideo((prevState) => ({ ...prevState, courseId }));
  }, []);

  useEffect(() => {
    let { group_name, title, video: video_url, courseId } = video;
    const isVideo = Object.values({
      group_name,
      title,
      video_url,
      courseId,
    }).every((el) => Boolean(el));
    isVideo ? setDisabled(false) : setDisabled(true);
  }, [video]);

  const handleChange = (e) => {
    const { name, value, files } = e.target;

    let fileSize;
    if (name === "thumb") {
      fileSize = files[0].size / 1024 / 1024;
      if (fileSize > 2) {
        toast.error("La taille de l'image ne doit pas depasser 2 Mo", {
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
      setVideo((prevState) => ({
        ...prevState,
        thumb: files[0],
      }));
      setThumbPreview(window.URL.createObjectURL(files[0]));
    } else if (name === "video") {
      fileSize = files[0].size / 1024 / 1024;
      if (fileSize > 100) {
        toast.error("La taille de la video ne doit pas depasser 100 Mo", {
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

      let media = new Audio(window.URL.createObjectURL(files[0]));
      media.onloadedmetadata = function () {
        setVideo((prevState) => ({
          ...prevState,
          video: files[0],
          video_length: media.duration,
        }));
      };
    } else {
      setVideo((prevState) => ({ ...prevState, [name]: value }));
    }
  };

  const handleVideoUpload = async () => {
    const data = new FormData();
    data.append("file", video.video);
    data.append("upload_preset", cloudinary.photo_preset);
    data.append("cloud_name", cloudinary.cloud_name);

    let response;
    if (video.video) {
      const cloudinary_url = `https://api.cloudinary.com/v1_1/${cloudinary.cloud_name}/video/upload`;
      response = await axios.post(cloudinary_url, data, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
        onUploadProgress: (progressEvent) => {
          setUploadProgress({
            ...uploadProgress,
            video: Math.round(
              (progressEvent.loaded * 100) / progressEvent.total
            ),
          });
        },
      });
    }

    const mediaUrl = response.data.url;
    return mediaUrl;
  };

  const handleThumbUpload = async () => {
    const data = new FormData();
    data.append("file", video.thumb);
    data.append("upload_preset", cloudinary.photo_preset);
    data.append("cloud_name", cloudinary.cloud_name);
    let response;
    if (video.thumb) {
      response = await axios.post(process.env.CLOUDINARY_URL, data, {
        onUploadProgress: (progressEvent) => {
          setUploadProgress({
            ...uploadProgress,
            thumb: Math.round(
              (progressEvent.loaded * 100) / progressEvent.total
            ),
          });
        },
      });
    }

    const imageUrl = response.data.url;

    return imageUrl;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      setLoading(true);
      let videoUrl = "";
      let thumbUrl = "";
      if (video.video) {
        const videoUpload = await handleVideoUpload();
        videoUrl = videoUpload.replace(/^http:\/\//i, "https://");
        const thumbUpload = await handleThumbUpload();
        thumbUrl = thumbUpload.replace(/^http:\/\//i, "https://");
      }

      const {
        group_name,
        title,
        video_length,
        is_preview,
        short_id,
        courseId,
      } = video;

      const payloadData = {
        group_name,
        title,
        thumb: thumbUrl,
        video: videoUrl,
        video_length,
        is_preview,
        short_id,
        courseId,
      };
      const url = `${baseUrl}/api/courses/course/upload/new`;
      const payloadHeader = {
        headers: { Authorization: edmy_users_token },
      };

      const response = await axios.post(url, payloadData, payloadHeader);

      toast.success(response.data.message, {
        style: {
          border: "1px solid #4BB543",
          padding: "16px",
          color: "#4BB543",
        },
        iconTheme: {
          primary: "#4BB543",
          secondary: "#FFFAEE",
        },
      });

      setLoading(false);

      router.push(`/instructor/course/uploads/${courseId}`);
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
    <form onSubmit={handleSubmit}>
      <div className="row">
        <div className="col-md-6">
          <div className="form-group">
            <label className="form-label fw-semibold">
              Nom du groupe de video
            </label>
            <input
              type="text"
              className="form-control"
              placeholder="Nom du groupe"
              name="group_name"
              value={video.group_name}
              onChange={handleChange}
            />
          </div>
        </div>
        <div className="col-md-6">
          <div className="form-group">
            <label className="form-label fw-semibold">Titre de la video</label>
            <input
              type="text"
              className="form-control"
              placeholder="Titre de la video"
              name="title"
              value={video.title}
              onChange={handleChange}
            />
          </div>
        </div>

        <div className="col-md-6">
          <div className="form-group">
            <label className="form-label fw-semibold">
              Choisir un thumbnail
            </label>
            <input
              type="file"
              className="form-control file-control"
              name="thumb"
              onChange={handleChange}
              required={true}
            />
            {uploadProgress.thumb > 0 && (
              <p className="text-danger">{uploadProgress.thumb}%</p>
            )}

            <div className="form-text">
              L'image devrais avoir une taille de 1280 x 720 pixels
            </div>

            <div className="mt-2">
              <img
                src={
                  thumbPreview ? thumbPreview : "/images/courses/course-1.jpg"
                }
                alt="image"
                className="img-thumbnail w-100px me-2"
              />
            </div>
          </div>
        </div>

        <div className="col-md-6">
          <div className="form-group">
            <label className="form-label fw-semibold">Choisir une video</label>
            <input
              type="file"
              className="form-control file-control"
              name="video"
              onChange={handleChange}
            />
            {uploadProgress.video > 0 && (
              <p className="text-danger">{uploadProgress.video}%</p>
            )}
          </div>
        </div>
        <div className="col-md-6">
          <div className="form-group">
            <label className="form-label fw-semibold">
              Ordre de la video dans le groupe (Croissant)
            </label>
            <input
              type="number"
              className="form-control"
              placeholder="Titre de la video"
              name="short_id"
              value={video.short_id}
              onChange={handleChange}
            />
          </div>
        </div>
        <div className="col-md-6">
          <div className="form-group">
            <input
              type="checkbox"
              className="form-check-input"
              id="is_preview"
              defaultChecked={video.is_preview}
              onChange={(e) =>
                setVideo((prevState) => ({
                  ...prevState,
                  is_preview: !video.is_preview,
                }))
              }
            />{" "}
            <label className="form-check-label" htmlFor="is_preview">
              Apercu de la video ?
            </label>
          </div>
        </div>

        <div className="col-12">
          <Button
            loading={loading}
            disabled={loading || disabled}
            btnText="Enregistrer"
            btnClass="default-btn"
          />
        </div>
      </div>
    </form>
  );
};

export default UploadVideoForm;
