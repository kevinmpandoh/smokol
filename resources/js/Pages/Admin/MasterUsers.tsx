import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { Head, router } from "@inertiajs/react";
import { PageProps } from "@/types";
import dayjs from "dayjs";

import {
    ReactElement,
    JSXElementConstructor,
    ReactPortal,
    useRef,
    useContext,
    useEffect,
    useState,
} from "react";
import {
    Button,
    Divider,
    Form,
    FormInstance,
    Input,
    InputRef,
    Modal,
    Space,
    Table,
    message,
    Popconfirm,
    Dropdown,
    MenuProps,
    DatePicker,
} from "antd";
import {
    EditOutlined,
    CaretDownOutlined,
    DeleteOutlined,
    PlusOutlined,
} from "@ant-design/icons";
import React from "react";
import {
    ColumnFilterItem,
    ColumnType,
    ColumnsType,
    CompareFn,
    SortOrder,
} from "antd/es/table/interface";
import MyModal from "@/Components/Modal";
import UserForm from "@/Forms/UserForm";
import axios from "axios";

interface DataType {
    key: React.Key;
    jenis: string;
    merk: string;
    tipe: string;
    tanggal_peroleh: string;
    nomor_seri: string;
}
interface User {
    id?: number;
    key?: number;
    nama_lengkap: string;
    email: string;
    nip?: string | undefined;
    bidang?: string | undefined;
    jabatan_id: number;
    jabatan: string;
    role: string;
    username?: string | undefined;
    foto_url?: string;
    password_hash: string;
}

const { Search } = Input;
const User = ({ users }: PageProps & { users: User[] }) => {
    // console.log({ master_barang });
    const csrfTokenRef = useRef<string | null>(null);
    const csrfTokenMeta = document.querySelector('meta[name="csrf-token"]');
    const [searchText, setSearchText] = useState("");
    const [searchLoading, setSearchLoading] = useState(false);
    const [messageApi, contextHolder] = message.useMessage();
    const saveKey = "updatable";
    const [itemAddForm] = Form.useForm();
    const [itemEditForm] = Form.useForm();

    // modal
    const [openModal, setOpenModal] = useState(false);
    const [openModalUbah, setOpenModalUbah] = useState(false);
    const [confirmLoadingModal, setConfirmLoadingModal] = useState(false);
    const [confirmLoadingModalUbah, setConfirmLoadingModalUbah] =
        useState(false);
    const handleOk = async () => {
        itemAddForm.submit();
        // setOpenModal(false);
        setConfirmLoadingModal(false);
    };
    const handleOkUbah = async () => {
        try {
            const validate = await itemEditForm.validateFields();
            itemEditForm.submit();
            setOpenModalUbah(false);
            setConfirmLoadingModalUbah(false);
        } catch (error) {}
    };
    const handleCancel = () => {
        setOpenModal(false);
    };
    const handleCancelUbah = () => {
        setOpenModalUbah(false);
    };
    //end modal

    const [dataSource, setDataSource] = useState<User[]>([]);

    useEffect(() => {
        if (csrfTokenMeta) {
            csrfTokenRef.current = csrfTokenMeta.getAttribute("content");
        }
    }, []);
    useEffect(() => {
        setTimeout(() => {
            let data_master = users.map(
                ({
                    id,

                    nama_lengkap,
                    email,
                    nip,
                    bidang,
                    jabatan_id,
                    jabatan,
                    role,
                    username,
                    foto_url,
                    password_hash,
                }) => ({
                    key: id,
                    id,
                    nama_lengkap,
                    email,
                    nip,
                    bidang,
                    jabatan_id,
                    jabatan,
                    role,
                    username,
                    foto_url,
                    password_hash,
                })
            );

            console.log("changeeeee", { users });
            setDataSource(data_master);
        }, 0);
    }, [users]);

    const onSearch = async (value: string) => {
        setSearchLoading(true);
        setSearchText(value);
        setSearchLoading(false);
    };
    const handleAdd = () => {
        itemAddForm.resetFields();
        setOpenModal(true);
    };

    type Sorter<T> = (a: T, b: T, sortOrder?: SortOrder) => number;

    function createSorter<T>(property: keyof T): Sorter<T> {
        return (a: T, b: T, sortOrder?: SortOrder): number => {
            const valueA = String(a[property]);
            const valueB = String(b[property]);

            if (sortOrder === "ascend") {
                // if (valueA < valueB) return -1;
                // if (valueA > valueB) return 1;
                return valueA.localeCompare(valueB);
            }

            if (sortOrder === "descend") {
                return -valueB.localeCompare(valueA);
            }

            return 0;
        };
    }
    async function handleDelete(key: React.Key | string) {
        messageApi.open({
            key: saveKey,
            content: "Sedang menghapus pengguna...",
            type: "loading",
        });

        // return 0;
        try {
            const url = route("admin.users.delete", { id: key });
            const response = await axios.delete(url);
            messageApi.open({
                key: saveKey,
                content: "Berhasil menghapus pengguna ",
                type: "success",
            });
            router.get(
                route("admin.master.users"),
                {},
                { preserveState: true, preserveScroll: true }
            );
        } catch (error: any) {
            messageApi.open({
                key: saveKey,
                content: error.message,
                type: "error",
            });
        }
    }
    const onFinishAdd: (values: any) => any = async (values: any) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang menambahkan pengguna...",
            type: "loading",
        });

        // return 0;
        try {
            const url = route("admin.users.store");
            const response = await axios.post(url, values, {
                headers: { "Content-Type": "application/json" },
            });
            messageApi.open({
                key: saveKey,
                content: "Berhasil menambahkan pengguna ",
                type: "success",
            });
            // router.get(route("admin.master.users"));
        } catch (error: any) {
            messageApi.open({
                key: saveKey,
                content: error.message,
                type: "error",
            });
        }
    };
    const onFinishEdit: (values: any) => any = async (values: any) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang menyimpan perubahan...",
            type: "loading",
        });
        try {
            // router.patch(route("users.update"), values, {
            //     onSuccess: (responsePage) => {
            //         const response: any = responsePage.props.response;
            //         console.log({ response });
            //         if (response.errors?.length > 1) {
            //             return messageApi.open({
            //                 key: saveKey,
            //                 content: response.errors,
            //                 type: "error",
            //             });
            //         }

            //         return 1;
            //     },
            // });
            const url = route("admin.users.update");
            const response = await axios.patch(url, values, {
                headers: { "Content-Type": "application/json" },
            });
            messageApi.open({
                key: saveKey,
                content: "Berhasil menyimpan perubahan",
                type: "success",
            });
            router.get(
                route("admin.master.users"),
                {},
                { preserveState: true, preserveScroll: true }
            );
        } catch (error: any) {
            messageApi.open({
                key: saveKey,
                content: error.message,
                type: "error",
            });
            return 0;
        }
    };

    const defaultColumns: ColumnsType<User> = [
        {
            title: "ID",
            dataIndex: "id",
        },
        {
            title: "nama_lengkap",
            dataIndex: "nama_lengkap",
        },
        { title: "email", dataIndex: "email" },
        { title: "bidang", dataIndex: "bidang" },
        { title: "jabatan", dataIndex: "jabatan" },
        { title: "role", dataIndex: "role" },
        { title: "username", dataIndex: "username" },
        { title: "foto", dataIndex: "foto" },
        { title: "password_hash", dataIndex: "password_hash" },

        {
            title: "edit",
            render: (_, record) => (
                <Button
                    onClick={() => {
                        setOpenModalUbah(true);

                        // itemEditForm.setFieldsValue(record);
                        itemEditForm.setFieldsValue(record);
                    }}
                >
                    <EditOutlined />
                    edit
                </Button>
            ),
        },
        {
            title: "delete",
            render: (_: any, record: any) => (
                <Button>
                    <Popconfirm
                        title="Hapus dari master"
                        description="Apakah anda yakin akan menghapus ini ? "
                        onConfirm={() => handleDelete(record.key ?? 0)}
                        onCancel={() => console.log("Cancel")}
                        okText="Ya"
                        cancelText="Batalkan"
                    >
                        <DeleteOutlined /> Hapus
                    </Popconfirm>
                </Button>
            ),
        },
    ];

    return (
        <Space direction="vertical" style={{ width: "100%" }}>
            <Head title="Daftar Pengguna" />
            <MyModal
                title={"Tambah Pengguna"}
                openModal={openModal}
                handleOk={handleOk}
                confirmLoadingModal={confirmLoadingModal}
                handleCancel={handleCancel}
                okText="Tambahkan"
                cancelText="Batal"
            >
                <UserForm
                    form={itemAddForm}
                    onFinish={onFinishAdd}
                    type="add"
                />
            </MyModal>
            <MyModal
                title={"Ubah Pengguna"}
                openModal={openModalUbah}
                handleOk={handleOkUbah}
                confirmLoadingModal={confirmLoadingModalUbah}
                handleCancel={handleCancelUbah}
                okText="Simpan"
                cancelText="Batal"
            >
                <UserForm
                    form={itemEditForm}
                    onFinish={onFinishEdit}
                    type="edit"
                />
            </MyModal>

            {contextHolder}
            <h1>Daftar Pengguna</h1>
            <Divider />
            <Space style={{ display: "flex", justifyContent: "space-between" }}>
                <Search
                    placeholder="Cari pengguna ..."
                    allowClear
                    onSearch={onSearch}
                    loading={searchLoading}
                    style={{ width: 200, marginBottom: "20px" }}
                />
                <Button
                    onClick={handleAdd}
                    type="primary"
                    style={{ marginBottom: 16 }}
                    icon={<PlusOutlined />}
                >
                    Daftarkan pengguna
                </Button>
            </Space>
            <Table
                style={{
                    // width: "100%",
                    // overflowX: "auto",
                    backgroundColor: "#fff",
                }}
                scroll={{ x: 1500 }}
                rowClassName={() => "editable-row"}
                bordered
                dataSource={dataSource.filter((item) =>
                    Object.values(item)
                        .join("")
                        .toLowerCase()
                        .includes(searchText.toLowerCase())
                )}
                columns={defaultColumns}
            />
        </Space>
    );
};

User.layout = (
    page: ReactElement<any, JSXElementConstructor<any>> | ReactPortal
) => (
    <AuthenticatedLayout
        user={page.props.auth.user}
        header={<h2 className="">Daftar Pengguna</h2>}
        selectedKey="admin.master.users"
        children={page}
    ></AuthenticatedLayout>
);
export default User;
