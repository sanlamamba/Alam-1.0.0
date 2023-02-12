import React from "react";
import Link from "next/link";

function Business() {
  return (
    <div className="business-area pb-100">
      <div className="container">
        <div className="business-bg rounded bg-color-f2f0ef ptb-100">
          <div className="row align-items-center">
            <div className="col-lg-7">
              <div className="business-img">
                <img src="/images/business-img.png" alt="business" />
              </div>
            </div>

            <div className="col-lg-5">
              <div className="business-content">
                <h2>Devenez professeur et offrez vos propres cours</h2>
                <p>
                  Nous proposons différents outils pour faciliter l'organisation
                  de vos propres cours, qu'il s'agisse d'un concepteur de cours
                  ou d'un tableau de bord pour suivre vos statistiques.
                </p>

                <Link href="/become-an-instructor">
                  <a className="default-btn">Devenez professeur.</a>
                </Link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Business;
