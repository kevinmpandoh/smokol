import React, { useEffect, useState } from "react";
import { Button } from "antd";
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

    console.log(status);

    function handleChangeMessage(e: any) {
        setMessage(e.target.value);
    }
    return (
        <section className="chat">
            <div className="header-chat">
                {/* <i className="icon fa fa-user-o" aria-hidden="true" />
                 */}
                <img
                    src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
                    alt=""
                    width={50}
                    height={50}
                    style={{
                        borderRadius: "50%",
                        objectFit: "cover",
                        marginBottom: "10px",
                    }}
                />
                <p className="name">Kevin Pandoh</p>
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
                                    <div
                                        className="photo"
                                        style={{
                                            backgroundImage:
                                                "url(https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80)",
                                        }}
                                    >
                                        <div className="online" />
                                    </div>
                                    <p className="text"> {item.konten} </p>
                                </div>
                                <p className="time"> 14h58</p>
                            </>
                        )}
                    </>
                ))}

                {/* <div className="message">
                    <div
                        className="photo"
                        style={{
                            backgroundImage:
                                "url(https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80)",
                        }}
                    >
                        <div className="online" />
                    </div>
                    <p className="text"> Hi, how are you ? </p>
                </div>
                <div className="message text-only">
                    <p className="text">
                        {" "}
                        What are you doing tonight ? Want to go take a drink ?
                    </p>
                </div>

                <p className="time"> 14h58</p>
                <div className="message text-only">
                    <div className="response">
                        <p className="text">
                            {" "}
                            Hey Megan ! It's been a while 😃
                        </p>
                    </div>
                </div>
                <div className="message text-only">
                    <div className="response">
                        <p className="text"> When can we meet ?</p>
                    </div>
                </div>
                <p className="response-time time"> 15h04</p>
                <div className="message">
                    <div
                        className="photo"
                        style={{
                            backgroundImage:
                                "url(https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80)",
                        }}
                    >
                        <div className="online" />
                    </div>
                    <p className="text"> 9 pm at the bar if possible 😳</p>
                </div>
                <p className="time"> 15h09</p> */}
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
