import React from "react";

const PartnerRow = ({ id, name, partner_image, onDelete }) => {
  return (
    <tr>
      <td>{name}</td>
      <td>
        <img src={partner_image} alt="image" className="w-100px" />
      </td>
      <td>
        <button
          onClick={() => onDelete(id)}
          type="button"
          className="btn btn-danger btn-sm fs-12"
        >
          Supprimer
        </button>
      </td>
    </tr>
  );
};

export default PartnerRow;
