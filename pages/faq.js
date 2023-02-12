import React from "react";
import Navbar from "@/components/_App/Navbar";
import PageBanner from "../components/Common/PageBanner";
import {
  Accordion,
  AccordionItem,
  AccordionItemHeading,
  AccordionItemPanel,
  AccordionItemButton,
} from "react-accessible-accordion";
import Footer from "@/components/_App/Footer";
import Business from "@/components/Index/Business";
import appInfo from "@/utils/appInfo";

export default function FAQPage({ user }) {
  return (
    <>
      <Navbar user={user} />

      <PageBanner
        pageTitle="FAQ"
        homePageUrl="/"
        homePageText="Accueil"
        activePageText="Foire Aux Questions"
      />

      <div className="faq-area ptb-100">
        <div className="container">
          <div className="faq-accordion">
            <Accordion allowZeroExpanded preExpanded={["a"]}>
              <AccordionItem uuid="a">
                <AccordionItemHeading>
                  <AccordionItemButton>
                    Comment puis-je accéder à mon compte sur {appInfo.name} LMS
                    ?
                  </AccordionItemButton>
                </AccordionItemHeading>
                <AccordionItemPanel>
                  <p>
                    Pour accéder à votre compte sur {appInfo.name} LMS, suivez
                    ces étapes: Accédez à notre site web et cliquez sur
                    "Connexion". Entrez votre adresse e-mail et votre mot de
                    passe. Cliquez sur "Se connecter". Vous devriez maintenant
                    être connecté à votre compte.
                  </p>
                </AccordionItemPanel>
              </AccordionItem>
              <AccordionItem uuid="b">
                <AccordionItemHeading>
                  <AccordionItemButton>
                    Comment puis-je suivre ma progression dans un cours sur{" "}
                    {appInfo.name}
                    LMS ?
                  </AccordionItemButton>
                </AccordionItemHeading>
                <AccordionItemPanel>
                  <p>
                    Pour suivre votre progression dans un cours sur{" "}
                    {appInfo.name} LMS, suivez ces étapes: Connectez-vous à
                    votre compte. Accédez au cours que vous souhaitez suivre.
                    Vous pouvez voir votre progression dans le cours en
                    utilisant la barre de progression sur la page du cours.
                  </p>
                </AccordionItemPanel>
              </AccordionItem>
              <AccordionItem uuid="c">
                <AccordionItemHeading>
                  <AccordionItemButton>
                    Comment puis-je télécharger les supports de cours sur{" "}
                    {appInfo.name}
                    LMS ?
                  </AccordionItemButton>
                </AccordionItemHeading>
                <AccordionItemPanel>
                  <p>
                    Pour télécharger les supports de cours sur {appInfo.name}{" "}
                    LMS, suivez ces étapes: Connectez-vous à votre compte.
                    Accédez au cours pour lequel vous souhaitez télécharger les
                    supports. Cliquez sur l'onglet "Supports de cours" ou
                    "Ressources". Vous devriez voir une liste de fichiers à
                    télécharger. Cliquez sur le fichier que vous souhaitez
                    télécharger pour le sauvegarder sur votre ordinateur.
                  </p>
                </AccordionItemPanel>
              </AccordionItem>
            </Accordion>
          </div>
        </div>
      </div>

      <Business />

      <Footer />
    </>
  );
}
