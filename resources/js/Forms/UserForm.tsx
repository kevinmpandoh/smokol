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

const UserForm: React.FC<{
    form: any;
    onFinish: (values: any) => void;
    type: string;
}> = ({ form, onFinish, type }) => {
    const inputRef = useRef<InputRef>(null);
    const [messageApi, contextHolder] = message.useMessage();
    const saveKey = "updatable";

    const [jabatanList, setJabatanList] = useState([]);

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
                const { data } = await axios.get(route("api.master.jabatan"));
                let jabatanList = data.map((item: any) => ({
                    label: `${item.nama} (${item.tingkat})`,
                    value: item.id,
                }));
                console.log({ jabatanList });
                setJabatanList(jabatanList);
            } catch (error) {}
        };
        fetchData();
    }, []);

    return (
        <Form
            form={form}
            name="UserForm"
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
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="nama_lengkap"
                name="nama_lengkap"
                // style={{ display: "none" }}
            >
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="nip"
                name="nip"
                // style={{ display: "none" }}
            >
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="email"
                name="email"
                // style={{ display: "none" }}
            >
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Jabatan"
                name="jabatan_id"
                // style={{ display: "none" }}
            >
                <Select
                    showSearch
                    options={jabatanList}
                    optionFilterProp="label"
                />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="bidang"
                name="bidang"
                // style={{ display: "none" }}
            >
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="role"
                name="role"
                // style={{ display: "none" }}
            >
                <Select options={roleList} />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="username"
                name="username"
                // style={{ display: "none" }}
            >
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="foto"
                name="foto"
                // style={{ display: "none" }}
            >
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="password"
                name="password"
                style={{ display: type == "edit" ? "none" : "" }}
            >
                <Input type="password" />
            </Form.Item>
        </Form>
    );
};
export default UserForm;
