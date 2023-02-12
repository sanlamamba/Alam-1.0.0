import React from "react";
import Link from "next/link";
import { motion } from "framer-motion";

const Footer = () => {
  const currentYear = new Date().getFullYear();
  return (
    <>
      <div className="footer-area bg-color-f6fafb pt-100 pb-70">
        <div className="container">
          <div className="row">
            <div className="col-lg-3 col-sm-6">
              <div className="single-footer-widget">
                <a href="index.html" className="logo">
                  <img
                    src="/images/logo.png"
                    className="main-logo"
                    alt="logo"
                    height={150}
                  />
                  <img
                    src="/images/white-logo.png"
                    className="white-logo"
                    alt="logo"
                  />
                </a>
                <p>
                  Notre mission est de rendre l'éducation accessible à tous dans
                  toute l'Afrique. Nos priorités sont nos étudiants et nos
                  enseignants.
                </p>
              </div>
            </div>

            <div className="col-lg-3 col-sm-6">
              <div className="single-footer-widget pl-40">
                <h3>Lien rapide</h3>

                <ul className="import-link">
                  <motion.li
                    whileHover={{
                      scale: 1.1,
                      originX: 0,
                      transition: { duration: 0.5 },
                    }}
                  >
                    <Link href="/courses">
                      <a>Cours</a>
                    </Link>
                  </motion.li>
                  <motion.li
                    whileHover={{
                      scale: 1.1,
                      originX: 0,
                      transition: { duration: 0.5 },
                    }}
                  >
                    <Link href="/about-us">
                      <a>À propos</a>
                    </Link>
                  </motion.li>
                  <motion.li
                    whileHover={{
                      scale: 1.1,
                      originX: 0,
                      transition: { duration: 0.5 },
                    }}
                  >
                    <Link href="/terms-conditions">
                      <a>Termes et conditions</a>
                    </Link>
                  </motion.li>
                </ul>
              </div>
            </div>

            <div className="col-lg-3 col-sm-6">
              <div className="single-footer-widget pl-40">
                <h3>Centre d'aide</h3>

                <ul className="import-link">
                  <motion.li
                    whileHover={{
                      scale: 1.1,
                      originX: 0,
                      transition: { duration: 0.5 },
                    }}
                  >
                    <Link href="/contact-us">
                      <a>Contact</a>
                    </Link>
                  </motion.li>
                  <motion.li
                    whileHover={{
                      scale: 1.1,
                      originX: 0,
                      transition: { duration: 0.5 },
                    }}
                  >
                    <Link href="/faq">
                      <a>FAQ</a>
                    </Link>
                  </motion.li>
                  <motion.li
                    whileHover={{
                      scale: 1.1,
                      originX: 0,
                      transition: { duration: 0.5 },
                    }}
                  >
                    <Link href="/privacy-policy">
                      <a>Politique de confidentialité</a>
                    </Link>
                  </motion.li>
                </ul>
              </div>
            </div>

            <div className="col-lg-3 col-sm-6">
              <div className="single-footer-widget">
                <h3>Informations de contact</h3>

                <ul className="info">
                  <li>
                    <span>Telephone:</span>{" "}
                    <a href={`tel:+221 70 952 93 18`}>+221 70 952 93 18</a>
                  </li>

                  <li>
                    <span>Email:</span>{" "}
                    <a href={`mailto:contact@alamapp.com`}>
                      contact@alamapp.com
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <img
          src="/images/footer-shape-1.png"
          className="shape shape-1"
          alt="footer"
        />
        <img
          src="/images/footer-shape-2.png"
          className="shape shape-2"
          alt="footer"
        />
      </div>

      <div className="copy-right-area bg-color-f6fafb">
        <div className="container">
          <p>
            &copy; Alam {currentYear} construit par{" "}
            <a href="https://sanlamamba.com/" target="_blank">
              San-Lamamba
            </a>
          </p>
        </div>
      </div>
    </>
  );
};

export default Footer;
