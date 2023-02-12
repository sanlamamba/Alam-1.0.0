import React, { useState, useEffect } from "react";
import Navbar from "@/components/_App/Navbar";
import Footer from "@/components/_App/Footer";
import AdminSideNav from "@/components/_App/AdminSideNav";
import Link from "next/link";
import toast from "react-hot-toast";
import axios from "axios";
import baseUrl from "@/utils/baseUrl";
import CatRow from "@/components/Admin/CatRow";
import { parseCookies } from "nookies";
import GeneralLoader from "@/utils/GeneralLoader";
import { confirmAlert } from "react-confirm-alert";

const Index = ({ user }) => {
  const { edmy_users_token } = parseCookies();
  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);

  const fetchData = async () => {
    setLoading(true);
    try {
      const payload = {
        headers: { Authorization: edmy_users_token },
      };
      const response = await axios.get(`${baseUrl}/api/categories`, payload);
      setCategories(response.data.categories);
      setLoading(false);
    } catch (err) {
      let {
        response: {
          data: { message },
        },
      } = err;
      toast.error(message, {
        style: {
          border: "1px solid #ff0033",
          padding: "16px",
          color: "#ff0033",
        },
        iconTheme: {
          primary: "#ff0033",
          secondary: "#FFFAEE",
        },
      });
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  const confirmDelete = (catId) => {
    confirmAlert({
      title: "Confirmer la suppression",
      message:
        "Êtes-vous sûr de vouloir supprimer cette catégorie? Cette action est irréversible.",
      buttons: [
        {
          label: "Oui",
          onClick: () => handleDelete(catId),
        },
        {
          label: "Non",
        },
      ],
    });
  };

  const handleDelete = async (catId) => {
    try {
      const payload = {
        headers: { Authorization: edmy_users_token },
        params: { catId },
      };
      const response = await axios.delete(`${baseUrl}/api/categories`, payload);
      toast.success(response.data.message, {
        style: {
          border: "1px solid #4BB543",
          padding: "16px",
          color: "#4BB543",
        },
        iconTheme: {
          primary: "#4BB543",
          secondary: "#FFFAEE",
        },
      });
      fetchData();
    } catch (err) {
      let {
        response: {
          data: { message },
        },
      } = err;
      toast.error(message, {
        style: {
          border: "1px solid #ff0033",
          padding: "16px",
          color: "#ff0033",
        },
        iconTheme: {
          primary: "#ff0033",
          secondary: "#FFFAEE",
        },
      });
    } finally {
      fetchData();
    }

    // router.reload(`/admin/categories/`);
  };

  return (
    <>
      <Navbar user={user} />

      <div className="main-content">
        <div className="container-fluid">
          <div className="row">
            <div className="col-lg-3 col-md-4">
              <AdminSideNav user={user} />
            </div>

            <div className="col-lg-9 col-md-8">
              <div className="main-content-box">
                {/* Nav */}
                <ul className="nav-style1">
                  <li>
                    <Link href="/admin/categories/">
                      <a className="active">Categories</a>
                    </Link>
                  </li>
                  <li>
                    <Link href="/admin/categories/create/">
                      <a>Creer</a>
                    </Link>
                  </li>
                </ul>

                {loading ? (
                  <GeneralLoader />
                ) : (
                  <div className="table-responsive">
                    <table className="table table-hover align-middle fs-14">
                      <thead>
                        <tr>
                          <th scope="col">Categories</th>
                          <th scope="col">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        {categories.length > 0 ? (
                          categories.map((cat) => (
                            <CatRow
                              {...cat}
                              key={cat.id}
                              onDelete={() => confirmDelete(cat.id)}
                            />
                          ))
                        ) : (
                          <tr>
                            <td colSpan="3" className="text-center py-3">
                              Vide!
                            </td>
                          </tr>
                        )}
                      </tbody>
                    </table>
                  </div>
                )}
                {/* Pagination */}
                {/* <div className="col-lg-12 col-md-12">
										<div className="pagination-area text-center m-3">
											<a
												href="#"
												className="prev page-numbers"
											>
												<i className="bx bx-chevrons-left"></i>
											</a>
											<span
												className="page-numbers current"
												aria-current="page"
											>
												1
											</span>
											<a
												href="#"
												className="page-numbers"
											>
												2
											</a>
											<a
												href="#"
												className="page-numbers"
											>
												3
											</a>
											<a
												href="#"
												className="page-numbers"
											>
												4
											</a>
											<a
												href="#"
												className="next page-numbers"
											>
												<i className="bx bx-chevrons-right"></i>
											</a>
										</div>
									</div> */}
              </div>
            </div>
          </div>
        </div>
      </div>

      <Footer />
    </>
  );
};

export default Index;
