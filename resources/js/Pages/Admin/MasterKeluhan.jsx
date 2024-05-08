import {
    ReactElement,
    JSXElementConstructor,
    ReactPortal,
    useRef,
    useContext,
    useEffect,
    useState,
} from "react";
import AuthenticatedLayout from "../../Layouts/AuthenticatedLayout";
import { Head, router } from "@inertiajs/react";

import { Button, Divider, Form, Space, Table, message, Popconfirm } from "antd";
import {
    EditOutlined,
    CaretDownOutlined,
    DeleteOutlined,
    PlusOutlined,
} from "@ant-design/icons";
import MyModal from "@/Components/Modal";
import UserForm from "@/Forms/UserForm";
import axios from "axios";

const MasterKeluhan = () => {
    const csrfTokenRef = useRef(null);
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

    //end modal

    const [dataSource, setDataSource] = useState([]);

    const defaultColumns = [
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
            render: (_, record) => (
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
MasterKeluhan.layout = () => (
    <AuthenticatedLayout
        user={page.props.auth.user}
        header={<h2 className="">Daftar Pengguna</h2>}
        selectedKey="admin.master.users"
        children={page}
    ></AuthenticatedLayout>
);
export default MasterKeluhan;
