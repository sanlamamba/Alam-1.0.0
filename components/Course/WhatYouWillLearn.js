import React from "react";

const WhatYouWillLearn = ({ what_you_will_learn }) => {
  return (
    <div className="this-course-content">
      <h3>Que vais je apprendre ? </h3>
      <div dangerouslySetInnerHTML={{ __html: what_you_will_learn }}></div>
    </div>
  );
};

export default WhatYouWillLearn;
