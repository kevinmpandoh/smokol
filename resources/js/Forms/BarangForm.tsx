import {
    Button,
    DatePicker,
    Divider,
    Form,
    Input,
    InputRef,
    Radio,
    Select,
    Space,
    message,
} from "antd";
import { useEffect, useRef, useState } from "react";
import { PlusOutlined } from "@ant-design/icons";
import axios from "axios";

import { router } from "@inertiajs/react";
import KondisiRadio from "@/Components/KondisiRadio";

const formItemLayout = {
    wrapperCol: { span: 24 },
};
const disabledStyle = {
    color: "#000",
};
let indexJenis = 0;
let indexMerk = 0;
let indexTipe = 0;
const HistoryBarangForm: React.FC<{
    form: any;
    type: string;
    onFinish: (values: any) => void;
}> = ({ form, onFinish, type }) => {
    const [penggunaName, setPenggunaName] = useState("");
    const [penggunaItems, setPenggunaItems] = useState<string[]>([]);
    const [jenisItems, setJenisItems] = useState<string[]>([]);
    const [jenisName, setJenisName] = useState("");

    const [kondisiValue, setKondisiValue] = useState("Baik");

    const [lokasiItems, setLokasiItems] = useState<string[]>([]);
    const [osItems, setOsItems] = useState<string[]>([]);
    const [barangItems, setBarangItems] = useState<string[]>([]);

    console.log(barangItems);

    const inputRef = useRef<InputRef>(null);

    const [messageApi, contextHolder] = message.useMessage();
    const saveKey = "updatable";

    const onPenggunaNameChanged = (
        event: React.ChangeEvent<HTMLInputElement>
    ) => {
        setPenggunaName(event.target.value);
    };
    useEffect(() => {
        setKondisiValue(form.getFieldValue("kondisi"));
    }, [form, form.getFieldValue("kondisi")]);

    useEffect(() => {
        // call api jenis
        const fetchData = async () => {
            try {
                const penggunaResponse = await axios.get(route("users.get"));
                const lokasiResponse = await axios.get(route("lokasi.get"));
                const osResponse = await axios.get(route("os.get"));
                const barangResponse = await axios.get(route("barang.get"));

                // console.log(barangResponse.data, "barangResponse");
                // console.log(osResponse.data, "osResponse");

                let barangDB = barangResponse.data.map((item: any) => ({
                    id: item.id,
                    nama_barang: item.nama_barang,
                }));
                setBarangItems(barangDB);
                let penggunaItemsDB = penggunaResponse.data[0].map(
                    (item: any) => ({
                        id: item.id,
                        nama_lengkap: item.nama_lengkap,
                    })
                );
                setPenggunaItems(penggunaItemsDB);

                let lokasiItemsDB = lokasiResponse.data[0].map((item: any) => ({
                    id: item.id,
                    name: item.nama,
                }));

                setLokasiItems(lokasiItemsDB);
                let osDB = osResponse.data.map((item: any) => ({
                    id: item.id,
                    name: item.nama_os,
                }));

                setOsItems(osDB);

                // setJenisItems(response.data);
            } catch (error) {
                console.log({ error });
            }
            // console.log({ jenisItems });
        };
        fetchData();
    }, []);

    useEffect(() => {
        console.log("Ok");
    }, []);

    const addJenisItem = (
        event: React.MouseEvent<HTMLButtonElement | HTMLAnchorElement>
    ) => {
        event.preventDefault();
        setJenisItems([
            ...jenisItems,
            jenisName || `New jenis item ${indexJenis++}`,
        ]);
        setJenisName("");
        setTimeout(() => {
            inputRef.current?.focus();
        }, 0);
    };

    return (
        <Form
            form={form}
            name="HistoryBarangForm"
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
                style={{ display: "none" }}
            >
                <Input />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Pegawai Pengguna"
                name="users_id"
                rules={[
                    {
                        required: true,
                        message: "Isian Pengguna harus diisi",
                    },
                ]}
            >
                <Select
                    showSearch
                    placeholder="Pilih Pengguna"
                    dropdownRender={(menu) => (
                        <>
                            {menu}
                            <Divider style={{ margin: "8px 0" }} />
                        </>
                    )}
                    options={penggunaItems.map((item: any) => ({
                        label: item.nama_lengkap,
                        value: item.id,
                    }))}
                    optionFilterProp="label"
                />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Lokasi Barang"
                name="ruangan_id"
                rules={[
                    {
                        required: true,
                        message: "Isian nomor seri harus diisi",
                    },
                ]}
            >
                <Select
                    showSearch
                    placeholder="Pilih Lokasi"
                    onSearch={(value) => {}}
                    optionFilterProp="label"
                    options={lokasiItems.map((item: any) => ({
                        label: item.name,
                        value: item.id,
                    }))}
                />
            </Form.Item>
            <KondisiRadio
                handleChange={(event) => {
                    setKondisiValue(event.target.value);
                    form.setFieldValue("kondisi", event.target.value);
                }}
                kondisiValue={kondisiValue}
            />

            <Form.Item
                {...formItemLayout}
                label="Sistem operasi yang digunakan"
                name="sistem_operasi_id"
            >
                <Select
                    showSearch
                    onSearch={(value) => {}}
                    optionFilterProp="label"
                    options={osItems.map((item: any) => ({
                        label: item.name,
                        value: item.id,
                    }))}
                />
            </Form.Item>

            <Divider />
            <Form.Item
                {...formItemLayout}
                label="Jenis"
                name="jenis"
                style={{ display: type == "add" ? "none" : "" }}
            >
                <Input disabled style={disabledStyle} />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Merek"
                name="merk"
                style={{ display: type == "add" ? "none" : "" }}
            >
                <Input disabled style={disabledStyle} />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="tipe"
                name="tipe"
                style={{ display: type == "add" ? "none" : "" }}
            >
                <Input disabled style={disabledStyle} />
            </Form.Item>

            <Form.Item
                {...formItemLayout}
                label="Tahun Peroleh"
                name="tahun_peroleh"
                style={{ display: type == "add" ? "none" : "" }}
            >
                <DatePicker disabled style={disabledStyle} />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Nomor Seri"
                name="nomor_seri"
                style={{ display: type == "add" ? "none" : "" }}
            >
                <Input disabled style={disabledStyle} />
            </Form.Item>
            <Form.Item
                {...formItemLayout}
                label="Nama Barang"
                name="barang_id"
                style={{ display: type == "edit" ? "none" : "" }}
            >
                <Select
                    showSearch
                    onSearch={(value) => {}}
                    optionFilterProp="label"
                    options={barangItems.map((item: any) => ({
                        label: item.nama_barang,
                        value: item.id,
                    }))}
                />
            </Form.Item>
        </Form>
    );
};
export default HistoryBarangForm;
