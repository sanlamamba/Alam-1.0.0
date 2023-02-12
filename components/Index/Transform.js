import React from "react";
import Link from "next/link";
import appInfo from "@/utils/appInfo";

const Transform = () => {
  return (
    <div className="transform-area pb-100">
      <div className="container">
        <div className="row align-items-center">
          <div className="col-lg-6 wow animate__animated animate__fadeInLeft delay-0-2s">
            <div className="transform-conetnt wow animate__animated animate__fadeInLeft delay-0-8s">
              <h2>Transformez votre vie grâce à l'éducation en ligne</h2>
              <p>
                Nous fournissons des cours et des outils de haut niveau à tous
                nos étudiants afin qu'ils puissent tirer le meilleur parti de
                leur temps et suivre leur voie à leur rythme.
              </p>

              <div className="single-transform d-flex align-items-center">
                <div className="transform-video-img flex-shrink-0">
                  <img src="/images/courses/course-16.jpg" alt="about" />
                  <Link href="/learning/my-courses">
                    <a className="video-btns popup-youtube">
                      <i className="ri-play-circle-fill"></i>
                    </a>
                  </Link>
                </div>

                <div className="transform-video-content flex-grow-1">
                  <h3>
                    <Link href="/learning/my-courses">
                      <a className="popup-youtube">Suivre un cours</a>
                    </Link>
                  </h3>
                  <ul>
                    <li>
                      Ne manquez pas une seule occasion d'apprendre et de
                      progresser, rejoignez-nous maintenant et suivez vos cours
                      sur {appInfo.name} LMS!
                    </li>
                  </ul>
                </div>
              </div>

              <Link href="/courses">
                <a className="default-btn">Découvrez nos cours</a>
              </Link>
            </div>
          </div>

          <div className="col-lg-6 wow animate__animated animate__fadeInRight delay-0-2s">
            <div className="transform-img wow animate__animated animate__fadeInRight delay-0-8s">
              <img src="/images/transform-img.png" alt="transform" />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Transform;
