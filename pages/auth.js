import React, { useState } from "react";
import PageBanner from "@/components/Common/PageBanner";
import Footer from "@/components/_App/Footer";
import Navbar from "@/components/_App/Navbar";
import LoginForm from "@/components/Authentication/LoginForm";
import RegisterForm from "@/components/Authentication/RegisterForm";
import { motion } from "framer-motion";

const auth = () => {
  const [register, setRegister] = useState("register");
  const [isOn, setIsOn] = useState(false);
  const toggleSwitch = () => setIsOn(!isOn);

  return (
    <>
      <Navbar />
      <PageBanner
        pageTitle="Authentication"
        homePageUrl="/"
        homePageText="Accueil"
        activePageText="S'Authentifier"
      />
      <div className="register-area ptb-100">
        <div className="container">
          <div className="row align-items-center">
            <div className="col-lg-6">
              <div className="register-img">
                <img src="/images/register-img.png" alt="Image" />
              </div>
            </div>
            <div className="col-lg-6">
              <div className="register-form">
                {register == "register" ? (
                  <motion.h2
                    initial={{ scale: 0 }}
                    animate={{ scale: 1, x: 0 }}
                    exit={{ scale: 0 }}
                  >
                    Créez votre compte
                  </motion.h2>
                ) : (
                  <motion.h2
                    initial={{ scale: 0 }}
                    animate={{ scale: 0.9, x: 0 }}
                    exit={{ scale: 1 }}
                  >
                    Connectez-vous
                  </motion.h2>
                )}

                <ul
                  className="register-tab nav nav-tabs justify-content-between"
                  data-ison={isOn}
                  onClick={toggleSwitch}
                >
                  <li className="nav-item" role="presentation">
                    <motion.button
                      className={`nav-link ${
                        register == "register" ? "active" : ""
                      }`}
                      onClick={() => setRegister("register")}
                      whileHover={{
                        scale: 1.05,
                        transition: { duration: 0.5 },
                      }}
                      whileTap={{ scale: 0.95 }}
                      layout
                      transition={{
                        type: "spring",
                      }}
                    >
                      Inscription
                    </motion.button>
                  </li>
                  <li className="nav-item" role="presentation">
                    <motion.button
                      className={`nav-link ${
                        register == "login" ? "active" : ""
                      }`}
                      type="button"
                      onClick={() => setRegister("login")}
                      whileHover={{
                        scale: 1.05,
                        transition: { duration: 0.5 },
                      }}
                      whileTap={{ scale: 0.95 }}
                      transition={{
                        type: "spring",
                      }}
                    >
                      Connecter
                    </motion.button>
                  </li>
                </ul>

                <div className="tab-content" id="myTabContent">
                  {register == "register" ? <RegisterForm /> : <LoginForm />}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <Footer />
    </>
  );
};

export default auth;
