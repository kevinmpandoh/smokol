import React, { useEffect, useState } from "react";
import { Form, Radio, RadioChangeEvent } from "antd";

const MyRadioGroup: React.FC<{
    handleChange: (e: RadioChangeEvent) => void;
    kondisiValue: string;
}> = ({ handleChange, kondisiValue }) => {
    const [selectedValue, setSelectedValue] = useState("");

    const handleRadioChange = (e: RadioChangeEvent) => {
        setSelectedValue(e.target.value);
        // console.log({ selectedValue });
    };

    return (
        <Form.Item name="kondisi" label="Kondisi Barang">
            <Radio.Group
                buttonStyle="solid"
                onChange={handleChange}
                value={kondisiValue}
            >
                <Radio.Button
                    value="Baik"
                    style={{
                        backgroundColor:
                            kondisiValue === "Baik" ? "#4CAF50" : "white",
                        color: kondisiValue === "Baik" ? "white" : "black",
                    }}
                >
                    Baik
                </Radio.Button>
                <Radio.Button
                    value="Rusak Ringan"
                    style={{
                        backgroundColor:
                            kondisiValue === "Rusak Ringan"
                                ? "#FFD700"
                                : "white",
                        color:
                            kondisiValue === "Rusak Ringan" ? "black" : "black",
                    }}
                >
                    Rusak Ringan
                </Radio.Button>
                <Radio.Button
                    value="Rusak Berat"
                    style={{
                        backgroundColor:
                            kondisiValue === "Rusak Berat"
                                ? "#FF6347"
                                : "white",
                        color:
                            kondisiValue === "Rusak Berat" ? "white" : "black",
                    }}
                >
                    Rusak Berat
                </Radio.Button>
            </Radio.Group>{" "}
        </Form.Item>
    );
};

export default MyRadioGroup;
