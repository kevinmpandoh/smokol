import React, { useEffect, useState } from "react";
import { Button, Avatar } from "antd";
import axios from "axios";
import { usePage } from "@inertiajs/react";

import { PageProps } from "@/types";

interface ModalProps {
    permintaanId?: any;
    messages?: any;
    handleSubmitPesan: any;
    status: string;
}

const Message = ({
    messages,
    permintaanId,
    handleSubmitPesan,
    status,
}: ModalProps) => {
    const [message, setMessage] = useState("");
    const { auth } = usePage<PageProps>().props;
    const [dataUser, setDataUser] = useState<any>([]);

    console.log(dataUser, "dataUser");

    function handleChangeMessage(e: any) {
        setMessage(e.target.value);
    }

    useEffect(() => {
        const fetchMessages = async () => {
            try {
                const response = await axios.get(
                    `/user-messages/${permintaanId}`
                );

                setDataUser(response.data);
            } catch (error) {
                console.error(error);
            }
        };

        fetchMessages();
    }, [permintaanId]);

    return (
        <section className="chat">
            <div className="header-chat">
                {/* <i className="icon fa fa-user-o" aria-hidden="true" />
                 */}

                <p className="name">
                    {auth.user.id == dataUser.user1_id
                        ? `Admin BPS`
                        : `${dataUser.nama_lengkap_1} (Basic)`}
                </p>
                <i
                    className="icon clickable fa fa-ellipsis-h right"
                    aria-hidden="true"
                />
            </div>
            <div className="messages-chat">
                {messages.map((item: any) => (
                    <>
                        {item.user_id == auth.user.id ? (
                            <>
                                <div className="message text-only">
                                    <div className="response">
                                        <p className="text"> {item.konten}</p>
                                    </div>
                                </div>
                            </>
                        ) : (
                            <>
                                <div className="message">
                                    <p className="text"> {item.konten} </p>
                                </div>
                            </>
                        )}
                    </>
                ))}
            </div>

            {status === "closed" ? null : (
                <form
                    onSubmit={(e) => {
                        e.preventDefault();
                        handleSubmitPesan(message, permintaanId);
                        setMessage("");
                    }}
                >
                    <div className="footer-chat">
                        <input
                            type="text"
                            className="write-message"
                            placeholder="Type your message here"
                            value={message}
                            onChange={handleChangeMessage}
                            name="message"
                            autoComplete="off"
                            autoFocus
                            disabled={status === "closed"}
                        />
                        <button
                            type="submit"
                            style={{
                                padding: "12px",
                                border: "none",
                                color: "#fff",
                                backgroundColor: "#04AA6D",
                                textAlign: "center",
                                textDecoration: "none",
                                fontSize: "16px",
                                borderRadius: "4px",
                                cursor: "pointer",
                            }}
                        >
                            Kirim Pesan
                        </button>
                    </div>
                </form>
            )}
        </section>
    );
};

export default Message;
