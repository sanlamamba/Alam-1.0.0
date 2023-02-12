import React from "react";
import axios from "axios";
import Router, { useRouter } from "next/router";
import baseUrl from "@/utils/baseUrl";

const confirmEmail = () => {
  const router = useRouter();

  React.useEffect(() => {
    const confirmEmail = async () => {
      try {
        const url = `${baseUrl}/api/users/confirm-email`;
        const payload = { token: router.query.token };
        const response = await axios.post(url, payload);
        console.log(response.data);
        Router.push("/auth");
        // send mail with nodemailer transport
        const url2 = `${baseUrl}/api/users/send-confirmation-email`;
        const payload2 = { email: response.data.email };
        const response2 = await axios.post(url2, payload2);
        console.log(response2.data);
      } catch (error) {
        console.log(error);
      }
    };

    confirmEmail();
  }, [router.query]);

  return <div>confirmEmail</div>;
};

export default confirmEmail;
