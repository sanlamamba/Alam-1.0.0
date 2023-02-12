import React from "react";
import PageBanner from "@/components/Common/PageBanner";
import Navbar from "@/components/_App/Navbar";
import Footer from "@/components/_App/Footer";
import ContactInfo from "@/components/ContactUs/ContactInfo";
import ContactForm from "@/components/ContactUs/ContactForm";

const contactUs = ({ user }) => {
  return (
    <>
      <Navbar user={user} />
      <PageBanner
        pageTitle="Contact"
        homePageUrl="/"
        homePageText="Accueil"
        activePageText="Contactez-nous"
      />

      <ContactInfo />
      <ContactForm />

      <Footer />
    </>
  );
};

export default contactUs;
