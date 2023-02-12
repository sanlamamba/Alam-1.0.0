import React from "react";
import PageBanner from "@/components/Common/PageBanner";
import Navbar from "@/components/_App/Navbar";
import Footer from "@/components/_App/Footer";
import appInfo from "@/utils/appInfo";

const privacyPolicy = ({ user }) => {
  return (
    <>
      <Navbar user={user} />
      <PageBanner
        pageTitle="Politique de confidentialité"
        homePageUrl="/"
        homePageText="Accueil"
        activePageText="Politique de confidentialité"
      />

      <section className="ptb-100">
        <div className="container">
          <div className="main-content-text">
            <h3 class="">1. Introduction</h3>
            <p>
              Politique de confidentialité d'{appInfo.name}. Explique comment
              les données sont collectées, utilisées, conservées et partagées.
            </p>
            <div class="gap-20"></div>

            <h3 class="">2. Collecte de données</h3>
            <p>
              Informations recueillies lors de l'utilisation de l'application, y
              compris les données personnelles.
            </p>
            <div class="gap-20"></div>

            <h3 class="">3. Cookies et technologies similaires</h3>
            <p>
              Utilisation des cookies et autres technologies pour améliorer
              l'expérience de l'utilisateur.
            </p>
            <div class="gap-20"></div>

            <h3 class="">4. Partage de données</h3>
            <p>
              Partage des données avec des tiers pour fournir des services et
              respecter la loi.
            </p>
            <div class="gap-20"></div>

            <h3 class="">5. Sécurité des données</h3>
            <p>
              Mesures de sécurité mises en place pour protéger les informations
              personnelles des utilisateurs.
            </p>
            <div class="gap-20"></div>

            <h3 class="">6. Droits de l'utilisateur</h3>
            <p>
              Droits des utilisateurs en matière de protection de leurs données
              personnelles.
            </p>
            <div class="gap-20"></div>

            <h3 class="">7. Mises à jour de la politique de confidentialité</h3>
            <p>
              Procédure pour les mises à jour de la politique de
              confidentialité.
            </p>
            <div class="gap-20"></div>

            <h3 class="">8. Contact</h3>
            <p>
              Comment contacter {appInfo.name} pour toute question ou
              préoccupation concernant la politique de confidentialité.
            </p>
            <div class="gap-20"></div>
          </div>
        </div>
      </section>

      <Footer />
    </>
  );
};

export default privacyPolicy;
