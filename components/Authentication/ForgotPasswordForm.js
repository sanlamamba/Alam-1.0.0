import React from "react";

const ForgotPasswordForm = () => {
  return (
    <>
      <div className="ptb-100">
        <div className="container">
          <div className="row justify-content-center">
            <div className="col-lg-6">
              <div className="login-form">
                <p>
                  Entrez votre adresse e-mail et nous vous enverrons un lien
                  pour réinitialiser votre mot de passe.
                </p>

                <form>
                  <div className="form-group">
                    <label>Email</label>
                    <input
                      type="text"
                      className="form-control"
                      placeholder="Email"
                    />
                  </div>

                  <button type="submit">Reinitialiser</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default ForgotPasswordForm;
