import appInfo from "@/utils/appInfo";
import React from "react";

const ContactInfo = () => {
  return (
    <div className="contact-info-area pt-100 pb-70">
      <div className="container">
        <div className="row justify-content-center">
          <div className="col-lg-4 col-md-6">
            <div className="single-contact-info d-flex align-items-center rounded bg-white shadow-sm">
              <img
                src="/images/contact-info-1.svg"
                alt="contact"
                className="border rounded-circle"
              />

              <div>
                <h3>Appeler-nous</h3>
                <ul>
                  <li>
                    <a href={`tel:${appInfo.phone}`}>{appInfo.phone}</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>

          <div className="col-lg-4 col-md-6">
            <div className="single-contact-info d-flex align-items-center rounded bg-white shadow-sm">
              <img
                src="/images/contact-info-2.svg"
                alt="contact"
                className="border rounded-circle"
              />

              <div>
                <h3>Email</h3>
                <ul>
                  <li>
                    <a href={`mailto:${appInfo.email}`}>{appInfo.email}</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>

          <div className="col-lg-4 col-md-6">
            <div className="single-contact-info d-flex align-items-center rounded bg-white shadow-sm">
              <img
                src="/images/contact-info-3.svg"
                alt="contact"
                className="border rounded-circle"
              />

              <div>
                <h3>Service client</h3>
                <p>- -</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ContactInfo;
