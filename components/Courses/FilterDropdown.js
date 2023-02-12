import React, { useEffect, useState } from "react";
import { useRouter } from "next/router";

const FilterDropdown = () => {
  const [short, setShort] = useState("");
  const router = useRouter();

  useEffect(() => {
    const query = router.query;
    router.push({
      pathname: "/courses",
      query: { ...query, short: short },
    });
  }, [short]);

  return (
    <li>
      <select
        className="form-select form-control"
        name="short"
        value={short}
        onChange={(e) => setShort(e.target.value)}
      >
        <option value="">Filtrer par</option>
        <option value="ASC">Prix: Ascendant </option>
        <option value="DESC">Prix: Descendant</option>
      </select>
    </li>
  );
};

export default FilterDropdown;
