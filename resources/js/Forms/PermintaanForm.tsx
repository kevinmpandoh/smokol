import {
    Button,
    DatePicker,
    DatePickerProps,
    Divider,
    Form,
    Input,
    InputRef,
    Select,
    Space,
    message,
} from "antd";
import dayjs from "dayjs";

import { useEffect, useRef, useState } from "react";
import { PlusOutlined } from "@ant-design/icons";
import axios from "axios";

import { router } from "@inertiajs/react";
import moment from "moment";

const formItemLayout = {
    wrapperCol: { span: 24 },
};

const PermintaanForm: React.FC<{
    form: any;
    onFinish: (values: any) => void;
    type: string;
}> = ({ form, onFinish, type }) => {
    const inputRef = useRef<InputRef>(null);
    const [messageApi, contextHolder] = message.useMessage();
    const saveKey = "updatable";

    const [ruanganList, setRuanganList] = useState([]);

    const roleList = [
        { label: "basic", value: "basic" },
        { label: "Tim IPDS", value: "Tim IPDS" },
        { label: "Tim BMN", value: "Tim BMN" },
        { label: "Tim PBJ/PPK", value: "Tim PBJ/PPK" },
        { label: "Super Admin", value: "Super Admin" },
    ];
    useEffect(() => {
        // call api jenis
        const fetchData = async () => {
            try {
                const { data } = await axios.get(
                    route("admin.master.ruangan.nama")
                );

                let ruanganList = data.map((item: any) => ({
                    label: `${item.nama}`,
                    value: item.id,
                }));

                setRuanganList(ruanganList);
            } catch (error) {}
        };
        fetchData();
    }, []);

    return (
        <Form
            form={form}
            name="PermintaanForm"
            onFinish={onFinish}
            autoComplete="off"
            style={{ maxWidth: "600px" }}
            layout="vertical"
        >
            {contextHolder}
            <Form.Item
                {...formItemLayout}
                label="id"
                name="id"
                style={{ display: type == "add" ? "none" : "none" }}
            >
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Nama Permintaan"
                name="nama_permintaan"
            >
                <Input disabled styles={{}} />
            </Form.Item>

            <Form.Item {...formItemLayout} label="Nama Item" name="nama_item">
                <Input disabled={type == "add" ? false : true} />
            </Form.Item>

            <Form.Item
                {...formItemLayout}
                label="Item Kategori"
                name="kategori"
            >
                <Input disabled={type == "add" ? false : true} />
            </Form.Item>

            <Form.Item
                {...formItemLayout}
                label="Sub Kategori"
                name="sub_kategori"
            >
                <Input disabled={type == "add" ? false : true} />
            </Form.Item>

            <Form.Item {...formItemLayout} label="Ruangan" name="ruangan_id">
                <Select
                    disabled={type == "add" ? false : true}
                    showSearch
                    options={ruanganList}
                    optionFilterProp="label"
                />
            </Form.Item>

            <Form.Item
                {...formItemLayout}
                label="Nomor Handphone"
                name="no_telp"
            >
                <Input disabled={type == "add" ? false : true} />
            </Form.Item>

            <Form.Item {...formItemLayout} label="Deskripsi" name="deskripsi">
                <Input.TextArea disabled={type == "add" ? false : true} />
            </Form.Item>

            <Form.Item
                {...formItemLayout}
                label="Status Permintaan"
                name="status"
            >
                <Select
                    style={{ display: type == "add" ? "none" : "block" }}
                    options={[
                        { label: "Open", value: "Open" },
                        { label: "Close", value: "Close" },
                    ]}
                    optionFilterProp="label"
                />
            </Form.Item>
        </Form>
    );
};
export default PermintaanForm;
