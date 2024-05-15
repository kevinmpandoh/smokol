import { Form, Input, InputRef, Select, Space, message } from "antd";
import dayjs from "dayjs";

import { useEffect, useRef, useState } from "react";
import { PlusOutlined } from "@ant-design/icons";
import axios from "axios";

import { router, usePage } from "@inertiajs/react";
import moment from "moment";
import { PageProps } from "@/types";

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
    const { auth } = usePage<PageProps>().props;
    const [roleAdmin, setRoleAdmin] = useState([]);

    const [ruanganList, setRuanganList] = useState([]);

    const kategoriList = [
        { label: "Minya Goreng", value: "basic" },
        { label: "Beras", value: "Tim IPDS" },
        { label: "Masako", value: "Tim BMN" },
        { label: "Ikang Garam", value: "Tim PBJ/PPK" },
        { label: "Ayam", value: "admin" },
        { label: "SupNasi", value: "Super Admin" },
    ];

    const subKategoriList = [
        { label: "Pedas", value: "basic" },
        { label: "Gurih", value: "Tim IPDS" },
        { label: "Asam", value: "Tim BMN" },
        { label: "Asin", value: "Tim PBJ/PPK" },
        { label: "Manis", value: "admin" },
        { label: "Pahit", value: "Super Admin" },
    ];

    useEffect(() => {
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

    useEffect(() => {
        const fetchData = async () => {
            try {
                const { data } = await axios.get(route("user.role"));

                console.log(data, "data");

                let userAdmin = data.map((item: any) => ({
                    label: `${item.nama_lengkap}`,
                    value: item.id,
                }));

                setRoleAdmin(userAdmin);
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
                style={{ display: type == "add" ? "none" : "" }}
            >
                <Input disabled />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Nama Permintaan"
                name="nama_permintaan"
            >
                <Input disabled={type == "add" ? false : true} />
            </Form.Item>

            <Form.Item {...formItemLayout} label="Nama Item" name="nama_item">
                <Input disabled={type == "add" ? false : true} />
            </Form.Item>

            <Form.Item
                {...formItemLayout}
                label="Item Kategori"
                name="kategori"
            >
                <Select
                    disabled={type == "add" ? false : true}
                    showSearch
                    options={kategoriList}
                    optionFilterProp="label"
                />
            </Form.Item>

            <Form.Item
                {...formItemLayout}
                label="Sub Kategori"
                name="sub_kategori"
            >
                <Select
                    disabled={type == "add" ? false : true}
                    showSearch
                    options={subKategoriList}
                    optionFilterProp="label"
                />
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
                label="Nama Admin"
                name="user2_id"
                style={{
                    display:
                        type == "add" || auth.user.role != "super admin"
                            ? "none"
                            : "block",
                }}
            >
                <Select options={roleAdmin} optionFilterProp="label" />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Status Permintaan"
                name="status"
                style={{ display: type == "add" ? "none" : "block" }}
            >
                <Select
                    options={[
                        { label: "Open", value: "open" },
                        { label: "Closed", value: "closed" },
                    ]}
                    optionFilterProp="label"
                />
            </Form.Item>
        </Form>
    );
};
export default PermintaanForm;
