import React, { useState, useEffect } from "react";
import controls from "@/utils/RTEControl";
import dynamic from "next/dynamic";
const RichTextEditor = dynamic(() => import("@mantine/rte"), {
  ssr: false,
  loading: () => null,
});
import axios from "axios";
import { parseCookies } from "nookies";
import baseUrl from "@/utils/baseUrl";
import toast from "react-hot-toast";
import { useRouter } from "next/router";
import Button from "@/utils/Button";
import cloudinary from "@/utils/cloudinaryConfig";

const INITIAL_VALUE = {
  title: "",
  short_desc: "",
  overview: "",
  latest_price: 0.0,
  before_price: 0.0,
  lessons: "",
  duration: "",
  image: "",
  access_time: "",
  requirements: "",
  what_you_will_learn: "",
  who_is_this_course_for: "",
  catId: "",
};

const CourseCreateForm = ({ btnText, is_class }) => {
  const { edmy_users_token } = parseCookies();
  const [course, setCourse] = useState(INITIAL_VALUE);
  const [disabled, setDisabled] = React.useState(true);
  const [loading, setLoading] = React.useState(false);
  const [categories, setCategories] = useState([]);
  const [imagePreview, setImagePreview] = React.useState("");
  const router = useRouter();

  useEffect(() => {
    const isCourse = Object.values(course).every((el) => Boolean(el));
    isCourse ? setDisabled(false) : setDisabled(true);
  }, [course]);

  useEffect(() => {
    const fetchData = async () => {
      const payload = {
        headers: { Authorization: edmy_users_token },
      };
      const response = await axios.get(`${baseUrl}/api/categories`, payload);
      setCategories(response.data.categories);
    };

    fetchData();
  }, []);

  const handleChange = (e) => {
    const { name, value, files } = e.target;

    if (name === "image") {
      const image = files[0].size / 1024 / 1024;
      if (image > 2) {
        toast.error("La taille de l'image ne doit pas dépasser 2 Mo", {
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
      setCourse((prevState) => ({
        ...prevState,
        image: files[0],
      }));
      setImagePreview(window.URL.createObjectURL(files[0]));
    } else {
      setCourse((prevState) => ({ ...prevState, [name]: value }));
    }
  };

  const handleImageUpload = async () => {
    console.log("IMAGE UPLOAD");
    const data = new FormData();
    data.append("file", course.image);
    data.append("upload_preset", cloudinary.photo_preset);
    data.append("cloud_name", cloudinary.cloud_name);

    let response;
    if (course.image) {
      console.log("CALLED");

      const cloudinary_url = `https://api.cloudinary.com/v1_1/${cloudinary.cloud_name}/image/upload`;
      response = await axios.post(cloudinary_url, data, {
        headers: {
          "Content-Type": "multipart /form-data",
        },
      });
      console.log(response);
    }
    const imageUrl = response.data.url;

    return imageUrl;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      setLoading(true);
      let photo;
      if (course.image) {
        photo = await handleImageUpload();

        photo = photo.replace(/^http:\/\//i, "https://");
      }

      const {
        title,
        short_desc,
        overview,
        latest_price,
        before_price,
        lessons,
        duration,
        access_time,
        requirements,
        what_you_will_learn,
        who_is_this_course_for,
        catId,
      } = course;
      const payloadData = {
        title,
        short_desc,
        overview,
        latest_price,
        before_price,
        lessons,
        duration,
        image: photo,
        access_time,
        requirements,
        what_you_will_learn,
        who_is_this_course_for,
        catId,
        is_class,
      };

      const payloadHeader = {
        headers: { Authorization: edmy_users_token },
      };

      const url = `${baseUrl}/api/courses/new`;
      const response = await axios.post(url, payloadData, payloadHeader);
      setLoading(false);

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

      if (is_class) {
        router.push(`/instructor/courses`);
      } else {
        router.push(`/instructor/course/upload/${response.data.course.id}`);
      }
    } catch (err) {
      // console.log(err);
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
            <label className="form-label fw-semibold">Titre du cours</label>
            <input
              type="text"
              className="form-control"
              placeholder="Course Title"
              name="title"
              value={course.title}
              onChange={handleChange}
            />
          </div>
        </div>

        <div className="col-md-6">
          <div className="form-group">
            <label className="form-label fw-semibold">Lessons</label>
            <input
              type="number"
              className="form-control"
              placeholder="5"
              name="lessons"
              value={course.lessons}
              onChange={handleChange}
            />
          </div>
        </div>

        <div className="col-md-6">
          <div className="form-group">
            <label className="form-label fw-semibold">Prix actuel</label>
            <input
              type="number"
              className="form-control"
              placeholder="10.000"
              aria-describedby="latest_price_help"
              name="latest_price"
              // value={course.latest_price}
              value={0}
              disabled
              onChange={handleChange}
            />
            <p className="form-text">
              Pour l'instant, le prix des cours sont fixés a 0 - Gratuit
            </p>
            <div id="latest_price_help" className="form-text">
              Le prix actuel du cours seras affiché sur la page du cours
            </div>
          </div>
        </div>

        <div className="col-md-6">
          <div className="form-group">
            <label className="form-label fw-semibold">Prix regulier</label>
            <input
              type="number"
              className="form-control"
              placeholder="15.000"
              aria-describedby="before_price_help"
              name="before_price"
              value={course.before_price}
              onChange={handleChange}
            />
            <div id="before_price_help" className="form-text">
              Le prix régulier du cours sera affiché comme <del>15.000</del>.
            </div>
          </div>
        </div>

        <div className="col-md-6">
          <div className="form-group">
            <label className="form-label fw-semibold">Durée</label>
            <input
              type="text"
              className="form-control"
              placeholder="4 Hours or 2 Weeks"
              name="duration"
              value={course.duration}
              onChange={handleChange}
            />
          </div>
        </div>

        <div className="col-md-6">
          <div className="form-group">
            <label className="form-label fw-semibold">Temps d'accès</label>
            <select
              className="form-select"
              name="access_time"
              value={course.access_time}
              onChange={handleChange}
            >
              <option value="">Selectionner</option>
              <option value="Lifetime">
                Lifetime - Accès à vie (sans limite de temps)
              </option>
              <option value="Three Months">
                3 Mois - Accès pendant 3 mois
              </option>
              <option value="Six Months">6 Mois - Accès pendant 6 mois</option>
              <option value="1 Year">
                1 An - Accès pendant 1 an (12 mois)
              </option>
            </select>
          </div>
        </div>

        <div className="col-md-6">
          <div className="form-group">
            <label className="form-label fw-semibold">Image du cours</label>
            <input
              type="file"
              className="form-control file-control"
              name="image"
              onChange={handleChange}
              required={true}
              accept="image/*"
            />
            <div className="form-text">
              L'image doit avoir une taille de 750x500 pixels
            </div>

            <div className="mt-2">
              <img
                src={
                  imagePreview ? imagePreview : "/images/courses/course-1.jpg"
                }
                alt="image"
                className="img-thumbnail w-100px me-2"
              />
            </div>
          </div>
        </div>

        <div className="col-md-6">
          <div className="form-group">
            <label className="form-label fw-semibold">Catégorie du cours</label>
            <select
              className="form-select"
              name="catId"
              value={course.catId}
              onChange={handleChange}
            >
              <option value="">Selectionner</option>
              {categories.length > 0 &&
                categories.map((cat) => (
                  <option key={cat.id} value={cat.id}>
                    {cat.name}
                  </option>
                ))}
            </select>
          </div>
        </div>

        <div className="col-md-12">
          <div className="form-group">
            <label className="form-label fw-semibold">
              Description du cours
            </label>
            <textarea
              className="form-control"
              name="short_desc"
              value={course.short_desc}
              rows="4"
              onChange={handleChange}
            />
            <div className="form-text">
              La description devrais être courte et claire
            </div>
          </div>
        </div>

        <div className="col-md-6">
          <div className="form-group">
            <label className="form-label fw-semibold">Vue d'ensemble</label>
            <RichTextEditor
              controls={controls}
              value={course.overview}
              onChange={(e) =>
                setCourse((prevState) => ({
                  ...prevState,
                  overview: e,
                }))
              }
            />
          </div>
        </div>
        <div className="col-md-6">
          <div className="form-group">
            <label className="form-label fw-semibold">Prérequis du cours</label>
            <RichTextEditor
              controls={controls}
              value={course.requirements}
              onChange={(e) =>
                setCourse((prevState) => ({
                  ...prevState,
                  requirements: e,
                }))
              }
            />
          </div>
        </div>
        <div className="col-md-6">
          <div className="form-group">
            <label className="form-label fw-semibold">
              Ce que vous apprendrez
            </label>
            <RichTextEditor
              controls={controls}
              value={course.what_you_will_learn}
              onChange={(e) =>
                setCourse((prevState) => ({
                  ...prevState,
                  what_you_will_learn: e,
                }))
              }
            />
          </div>
        </div>
        <div className="col-md-6">
          <div className="form-group">
            <label className="form-label fw-semibold">
              Pour qui est ce cours?
            </label>
            <RichTextEditor
              controls={controls}
              value={course.who_is_this_course_for}
              onChange={(e) =>
                setCourse((prevState) => ({
                  ...prevState,
                  who_is_this_course_for: e,
                }))
              }
            />
          </div>
        </div>

        <div className="col-12">
          <input
            type={"submit"}
            className="btn btn-primary"
            value="Enregistrer"
          />
          {/*               
          <Button
            loading={loading}
            disabled={disabled}
            btnText={btnText || "Créer le cours"}
            btnClass="default-btn"
            type="submit"
          /> */}
        </div>
      </div>
    </form>
  );
};

export default CourseCreateForm;
