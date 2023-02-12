import React from "react";
import PageBanner from "@/components/Common/PageBanner";
import Navbar from "@/components/_App/Navbar";
import Footer from "@/components/_App/Footer";
import RegisterForm from "@/components/BecomeAInstructor/RegisterForm";

const becomeInstructor = ({ user }) => {
  return (
    <>
      <Navbar user={user} />
      <PageBanner
        pageTitle="Devenir un professeur"
        homePageUrl="/"
        homePageText="Accueil"
        activePageText="Devenir un professeur"
      />
      <RegisterForm user={user} />
      <Footer />
    </>
  );
};

export default becomeInstructor;
