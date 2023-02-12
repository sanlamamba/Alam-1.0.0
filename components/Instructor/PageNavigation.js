import React, { useState, useEffect } from "react";
import Link from "next/link";
import axios from "axios";
import { parseCookies } from "nookies";
import baseUrl from "@/utils/baseUrl";

const PageNavigation = ({ courseId, activeClassname }) => {
  const { edmy_users_token } = parseCookies();
  const [course, setCourse] = useState({ title: "" });

  useEffect(() => {
    const fetchCourse = async () => {
      const payload = {
        headers: { Authorization: edmy_users_token },
      };
      const url = `${baseUrl}/api/courses/course/${courseId}`;
      const response = await axios.get(url, payload);
      setCourse({ title: response.data.course.title });
    };

    fetchCourse();
  }, []);

  return (
    <>
      <h2 className="fw-bold mb-4">Titre: {course && course.title}</h2>

      <ul className="nav-style1">
        <li>
          <Link href="/instructor/courses/">
            <a>Cours</a>
          </Link>
        </li>
        <li>
          <Link href="/instructor/course/create/">
            <a>Creer un cours</a>
          </Link>
        </li>
        <li>
          <Link href={`/instructor/course/edit/${courseId}`}>
            <a className={activeClassname == "edit" ? "active" : ""}>
              Modifier le cours
            </a>
          </Link>
        </li>
        <li>
          <Link href={`/instructor/course/upload/${courseId}`}>
            <a className={activeClassname == "upload" ? "active" : ""}>
              Televerser une video
            </a>
          </Link>
        </li>
        <li>
          <Link href={`/instructor/course/uploads/${courseId}`}>
            <a className={activeClassname == "uploads" ? "active" : ""}>
              Videos
            </a>
          </Link>
        </li>
        <li>
          <Link href={`/instructor/course/assets/${courseId}`}>
            <a className={activeClassname == "assets" ? "active" : ""}>
              Actifs
            </a>
          </Link>
        </li>
      </ul>
    </>
  );
};

export default PageNavigation;
