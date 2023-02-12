import React from "react";
import PageBanner from "@/components/Common/PageBanner";
import Navbar from "@/components/_App/Navbar";
import Footer from "@/components/_App/Footer";
import appInfo from "@/utils/appInfo";

const termsConditions = ({ user }) => {
  return (
    <>
      <Navbar user={user} />
      <PageBanner
        pageTitle="Terms & Conditions"
        homePageUrl="/"
        homePageText="Home"
        activePageText="Terms & Conditions"
      />
      <section className="ptb-100">
        <div className="container">
          <div className="main-content-text">
            <h1>Conditions Générales</h1>
            <p>
              Bienvenue sur {appInfo.name}, un système de gestion en ligne des
              apprentissages basé à Dakar, Sénégal. Veuillez lire attentivement
              les présentes conditions générales avant d'utiliser le site web et
              les services d'{appInfo.name}. En accédant ou en utilisant{" "}
              {appInfo.name}, vous acceptez d'être lié par les conditions
              générales suivantes.
            </p>
            <div className="gap-20"></div>

            <h3>Description des services</h3>
            <p>
              {appInfo.name} fournit une plateforme en ligne pour la gestion des
              apprentissages. Les services comprennent entre autres
              l'hébergement de contenu éducatif, la communication entre les
              enseignants et les étudiants, et l'évaluation des performances.
            </p>
            <div className="gap-20"></div>

            <h3>Programmes tiers</h3>
            <p>
              {appInfo.name} peut utiliser des programmes tiers pour fournir
              certains services et fonctionnalités. En utilisant {appInfo.name},
              vous acceptez la collecte et l'utilisation de vos informations par
              ces programmes tiers, tels que décrits dans la présente section et
              la politique de confidentialité d'{appInfo.name}. {appInfo.name}{" "}
              ne peut être tenu responsable de la collecte et de l'utilisation
              de vos informations par ces programmes tiers.
            </p>
            <div className="gap-20"></div>

            <h3>Cookies</h3>
            <p>
              {appInfo.name} utilise des cookies pour améliorer l'expérience de
              l'utilisateur et collecter des informations anonymes sur
              l'utilisation du site web. En utilisant {appInfo.name}, vous
              acceptez l'utilisation de ces cookies.
            </p>
            <div className="gap-20"></div>
            <h3>Paiements</h3>
            <p>
              {appInfo.name} accepte les paiements en ligne via les méthodes
              suivantes : cartes de crédit, PayPal, virements bancaires et
              autres moyens de paiement en ligne sécurisés.
            </p>
            <p>
              En utilisant les services de paiement en ligne, vous acceptez les
              conditions générales et les politiques de confidentialité des
              prestataires de services de paiement en ligne.
            </p>
            <p>
              {appInfo.name} se réserve le droit de refuser tout paiement pour
              des raisons de sécurité ou de non-conformité avec les conditions
              générales d'utilisation d'{appInfo.name}.
            </p>
            <p>
              Tous les paiements sont facturés en monnaie locale et peuvent être
              soumis à des frais de conversion de devises.
            </p>
            <p>
              En cas de non-paiement, {appInfo.name} se réserve le droit de
              suspendre ou de résilier les services pour l'utilisateur en
              question.
            </p>
            <div className="gap-20"></div>
            <h3>Collecte d'informations des utilisateurs</h3>
            <p>
              {appInfo.name} peut collecter des informations sur ses
              utilisateurs pour améliorer ses services et personnaliser
              l'expérience de ses utilisateurs.
            </p>
            <p>
              Ces informations peuvent inclure, mais sans s'y limiter, les
              informations personnelles telles que le nom, l'adresse
              électronique, l'emplacement géographique, les informations de
              paiement et les données d'utilisation.
            </p>
            <p>
              {appInfo.name} s'engage à protéger la confidentialité de ces
              informations et à ne pas les vendre ou les partager avec des tiers
              sans votre consentement explicite.
            </p>
          </div>
        </div>
      </section>
      <Footer />
    </>
  );
};

export default termsConditions;
