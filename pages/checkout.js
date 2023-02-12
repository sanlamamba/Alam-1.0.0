import React from "react";
import CheckoutForm from "@/components/Checkout/CheckoutForm";
import PageBanner from "@/components/Common/PageBanner";
import Navbar from "@/components/_App/Navbar";
import Footer from "@/components/_App/Footer";

const checkout = ({ user }) => {
  return (
    <>
      <Navbar user={user} />
      <PageBanner
        pageTitle="Validation de la commande"
        homePageUrl="/courses"
        homePageText="Cours"
        activePageText="Validation"
      />
      <CheckoutForm user={user} />
      <Footer />
    </>
  );
};

export default checkout;
