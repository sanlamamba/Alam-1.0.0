import React from "react";

const Features = () => {
  return (
    <div className="our-features-area bg-color-f1efee pt-100 pb-70">
      <div className="container">
        <div className="section-title">
          <span className="top-title">Nos particularités</span>
          <h2>Pourquoi choisir Alam?</h2>
        </div>

        <div className="row justify-content-center">
          <div className="col-lg-3 col-sm-6">
            <div className="single-features">
              <img src="/images/features/feature-1.svg" alt="feature" />
              <h3>Cours vidéo animés par des experts</h3>
              <p>
                Des instructeurs du monde entier enseignent à des millions
                d'étudiants sur Alam par le biais de la vidéo.
              </p>
            </div>
          </div>

          <div className="col-lg-3 col-sm-6">
            <div className="single-features">
              <img src="/images/features/feature-2.svg" alt="feature" />
              <h3>Cours orientés vers la communauté</h3>
              <p>
                Nous sommes toujours à votre ecoute, donc nous développons des
                cours et des leçons en fonction de la demande.
              </p>
            </div>
          </div>

          <div className="col-lg-3 col-sm-6 ">
            <div className="single-features">
              <img src="/images/features/feature-3.svg" alt="feature" />
              <h3>Cours orientés vers la communauté</h3>
              <p>
                Nous sommes toujours à votre ecoute, donc nous développons des
                cours et des leçons en fonction de la demande.
              </p>
            </div>
          </div>

          <div className="col-lg-3 col-sm-6">
            <div className="single-features">
              <img src="/images/features/feature-4.svg" alt="feature" />
              <h3>Un apprentissage toujours interactif</h3>

              <p>
                Nos cours composés de vidéos sont toujours interactifs, et nos
                groupes de discussion facilitent l'échange entre tous.
              </p>
            </div>
          </div>
        </div>
      </div>

      <img
        src="/images/features/feature-shape-1.svg"
        className="shape shape-1"
        alt="feature"
      />
    </div>
  );
};

export default Features;
