import Link from "next/link";
import React from "react";
import SearchForm from "@/components/_App/SearchForm";
import AnimatedCharacters from "./BannerText";
import { motion } from "framer-motion";

const Banner = () => {
  const headingText = [
    {
      type: "heading",
      text: "Votre Application    de E-learning",
    },
  ];

  const variants = {
    visible: {
      transition: {
        staggerChildren: 0.025,
      },
    },
  };

  const pVariants = {
    hidden: {
      scale: 0.8,
      opacity: 0,
    },
    visible: {
      scale: 1,
      opacity: 1,
      transition: {
        delay: 1.9,
      },
    },
  };

  return (
    <div className="banner-area bg-1">
      <div className="container-fluid">
        <div className="row align-items-center">
          <div className="col-lg-6">
            <div className="banner-img">
              <motion.img
                initial={{ scale: 0 }}
                animate={{ scale: 1 }}
                src="/images/banner/banner-img-1.png"
                alt="banner"
              />
            </div>
          </div>

          <div className="col-lg-6">
            <motion.div
              initial="hidden"
              animate="visible"
              variants={variants}
              className="banner-content"
            >
              {headingText.map((item, index) => {
                return <AnimatedCharacters {...item} key={index} />;
              })}
              <motion.p initial="hidden" animate="visible" variants={pVariants}>
                Nous proposons <span>divers cours en ligne </span>provenant
                d'enseignants du monde entier, sur des sujets variés et bien
                plus encore. Trouvez les cours que vous souhaitez dès maintenant
                !
              </motion.p>

              <SearchForm
                formClass="search-form"
                btnClass="default-btn"
                banner={true}
              />

              <ul className="client-list">
                <li>
                  <img src="/images/banner/client-1.jpg" alt="banner" />
                  <img
                    src="/images/banner/client-2.jpg"
                    className="client"
                    alt="banner"
                  />
                  <img
                    src="/images/banner/client-3.jpg"
                    className="client"
                    alt="banner"
                  />
                </li>
                <li>
                  <p>
                    Rejoignez notre communauté grandissante .{" "}
                    <Link href="/courses">
                      <a className="read-more">
                        Rejoindre <i className="ri-arrow-right-line"></i>
                      </a>
                    </Link>
                  </p>
                </li>
              </ul>
            </motion.div>
          </div>
        </div>
      </div>

      <img
        src="/images/banner/shape-1.svg"
        className="shape shape-1"
        alt="banner"
      />
      <img
        src="/images/banner/shape-2.svg"
        className="shape shape-2"
        alt="banner"
      />
      <img
        src="/images/banner/shape-3.svg"
        className="shape shape-3"
        alt="banner"
      />
    </div>
  );
};

export default Banner;
