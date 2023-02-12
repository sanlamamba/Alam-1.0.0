import React from "react";
import Link from "next/link";
import appInfo from "@/utils/appInfo";

const Teaching = () => {
  return (
    <div className="teaching-area ptb-100">
      <div className="container">
        <div className="row align-items-center">
          <div className="col-lg-6">
            <div className="teaching-content mr-15">
              <h2>
                Devenez un instructeur aujourd'hui et commencez à enseigner
              </h2>
              <p>
                Des instructeurs du monde entier enseignent à des millions
                d'étudiants sur {appInfo.name}. Nous fournissons les outils et
                les compétences nécessaires pour enseigner ce que vous aimez. Et
                vous pouvez également atteindre votre objectif avec nous.
              </p>

              <div className="row">
                <div className="col-lg-6 col-sm-6">
                  <ul>
                    <li className="d-flex align-items-center">
                      <img
                        src="/images/icon/teaching-icon-1.svg"
                        alt="teaching"
                      />
                      <h3>Instruction des experts</h3>
                    </li>
                    <li className="d-flex align-items-center">
                      <img
                        src="/images/icon/teaching-icon-3.svg"
                        alt="teaching"
                      />
                      <h3>Apprentissage à distance</h3>
                    </li>
                  </ul>
                </div>

                <div className="col-lg-6 col-sm-6">
                  <ul className="teaching-list">
                    <li className="d-flex align-items-center">
                      <img
                        src="/images/icon/teaching-icon-2.svg"
                        alt="teaching"
                      />
                      <h3>Accès permanent</h3>
                    </li>
                    <li className="d-flex align-items-center">
                      <img
                        src="/images/icon/teaching-icon-4.svg"
                        alt="teaching"
                      />
                      <h3>partout et à tout moment</h3>
                    </li>
                  </ul>
                </div>
              </div>

              <Link href="/become-an-instructor">
                <a className="default-btn">Devenir un instructeur</a>
              </Link>
            </div>
          </div>

          <div className="col-lg-6">
            <div className="teaching-img ml-15">
              <img
                src="/images/teaching-img-shape.png"
                className="teaching-img-shape"
                alt="teaching"
              />
              <img src="/images/teaching-img.png" alt="teaching" />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Teaching;
