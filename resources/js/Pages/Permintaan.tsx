import {
    ReactElement,
    JSXElementConstructor,
    ReactPortal,
    useRef,
    useContext,
    useEffect,
    useState,
} from "react";

import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { Head, router, usePage } from "@inertiajs/react";
import { PageProps } from "@/types";
import {
    Space,
    Divider,
    Table,
    Button,
    Input,
    Form,
    message,
    Popconfirm,
} from "antd";

import MyModal from "@/Components/Modal";
import PermintaanForm from "@/Forms/PermintaanForm";
import axios from "axios";

import { ColumnsType } from "antd/es/table/interface";

import { EditOutlined, DeleteOutlined, PlusOutlined } from "@ant-design/icons";
import Message from "@/Components/Message";

interface Permintaan {
    id?: number;
    key?: React.Key;
    no_ticket: string;
    status: string;
    nama_item?: string;
    kategori?: string;
    sub_kategori?: string;
    no_telp?: string;
    ruangan_id?: number;
    users_nama?: string;
    deskripsi?: string;
    nama_permintaan: string;
    nama_ruangan?: string;
    user2_nama?: string;
    user2_id?: any;
}

const { Search } = Input;

const Permintaan = ({
    permintaan,
}: PageProps & { permintaan: Permintaan[] }) => {
    const [searchLoading, setSearchLoading] = useState(false);
    const [itemAddForm] = Form.useForm();
    const [itemEditForm] = Form.useForm();
    const [messageApi, contextHolder] = message.useMessage();
    const [permintaanId, setPermintaanId] = useState(0);
    const [status, setStatus] = useState("");
    const { auth } = usePage<PageProps>().props;
    const [messages, setMessages] = useState<any[]>([]);

    console.log(messages);

    const saveKey = "updatable";

    // Modal
    const [openModal, setOpenModal] = useState(false);
    const [openModalUbah, setOpenModalUbah] = useState(false);
    const [openModalPesan, setOpenModalPesan] = useState(false);

    const [confirmLoadingModal, setConfirmLoadingModal] = useState(false);
    const [confirmLoadingModalUbah, setConfirmLoadingModalUbah] =
        useState(false);
    const [confirmLoadingModalPesan, setConfirmLoadingModalPesan] =
        useState(false);

    const [dataSource, setDataSource] = useState<Permintaan[]>([]);

    useEffect(() => {
        setTimeout(() => {
            let data_master = permintaan.map(
                ({
                    id,
                    no_ticket,
                    nama_permintaan,
                    deskripsi,
                    nama_item,
                    kategori,
                    sub_kategori,
                    ruangan_id,
                    no_telp,
                    users_nama,
                    nama_ruangan,
                    status,
                    user2_nama,
                    user2_id,
                }) => ({
                    key: id,
                    id,
                    no_ticket,
                    nama_permintaan,
                    deskripsi,
                    nama_item,
                    kategori,
                    sub_kategori,
                    ruangan_id,
                    users_nama,
                    nama_ruangan,
                    no_telp,
                    status,
                    user2_nama,
                    user2_id,
                })
            );
            setDataSource(data_master);
        }, 0);
    }, [permintaan]);

    useEffect(() => {
        const fetchData = async () => {
            try {
                const { data } = await axios.get(
                    route("pesan.percakapan", { id: permintaanId })
                );

                setMessages(data);
            } catch (error) {}
        };
        fetchData();
    }, [permintaanId]);

    const handleAdd = () => {
        itemAddForm.resetFields();
        setOpenModal(true);
    };

    const handleCancel = () => {
        setOpenModal(false);
    };

    const handleOk = async () => {
        itemAddForm.submit();
        // setOpenModal(false);
        setConfirmLoadingModal(false);
    };

    const handleCancelUbah = () => {
        setOpenModalUbah(false);
    };

    const handleOkUbah = async () => {
        try {
            const validate = await itemEditForm.validateFields();
            itemEditForm.submit();
            setOpenModalUbah(false);
            setConfirmLoadingModalUbah(false);
        } catch (error) {}
    };

    const submitPesan = async (message: any, permintaanId: any) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang mengirim pesan...",
            type: "loading",
        });
        try {
            const url = route("pesan.store");

            const response = await axios.post(url, {
                konten: message,
                permintaan_id: permintaanId,
            });

            console.log({ response });

            messageApi.open({
                key: saveKey,
                content: "Berhasil mengirim pesan",
                type: "success",
            });
            // router.get(route("permintaan"));
        } catch (error: any) {
            messageApi.open({
                key: saveKey,
                content: error.message,
                type: "error",
            });
        }
    };

    const handleCancelPesan = () => {
        setOpenModalPesan(false);
    };

    const onFinishAdd: (values: any) => any = async (values: any) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang menambahkan permintaan...",
            type: "loading",
        });
        // return 0;
        try {
            const url = route("permintaan.store");
            const response = await axios.post(url, values, {
                headers: { "Content-Type": "application/json" },
            });
            messageApi.open({
                key: saveKey,
                content: "Berhasil menambahkan permintaan ",
                type: "success",
            });
            router.get(route("permintaan"));
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
            content: "Sedang mengubah permintaan...",
            type: "loading",
        });
        // return 0;
        try {
            const url = route("permintaan.update");
            const response = await axios.patch(url, values, {
                headers: { "Content-Type": "application/json" },
            });
            messageApi.open({
                key: saveKey,
                content: "Berhasil mengubah permintaan ",
                type: "success",
            });
            router.get(route("permintaan"));
        } catch (error: any) {
            messageApi.open({
                key: saveKey,
                content: error.message,
                type: "error",
            });
        }
        // messageApi.open({
        //     key: saveKey,
        //     content: "Sedang menyimpan perubahan...",
        //     type: "loading",
        // });
        // try {
        //     router.patch(route("permintaan.update"), values, {
        //         onSuccess: (responsePage) => {
        //             const response: any = responsePage.props.response;
        //             console.log({ response });
        //             if (response.errors?.length > 1) {
        //                 return messageApi.open({
        //                     key: saveKey,
        //                     content: response.errors,
        //                     type: "error",
        //                 });
        //             }
        //             return 1;
        //         },
        //     });

        //     // router.get(route("permintaan"));

        //     // const url = route("admin.users.update");
        //     // const response = await axios.patch(url, values, {
        //     //     headers: { "Content-Type": "application/json" },
        //     // });
        //     // messageApi.open({
        //     //     key: saveKey,
        //     //     content: "Berhasil menyimpan perubahan",
        //     //     type: "success",
        //     // });
        //     // router.get(
        //     //     route("admin.master.users"),
        //     //     {},
        //     //     { preserveState: true, preserveScroll: true }
        //     // );
        // } catch (error: any) {
        //     messageApi.open({
        //         key: saveKey,
        //         content: error.message,
        //         type: "error",
        //     });
        //     return 0;
        // }
    };

    async function handleDelete(key: React.Key | string) {
        messageApi.open({
            key: saveKey,
            content: "Sedang menghapus pengguna...",
            type: "loading",
        });

        // return 0;
        try {
            const url = route("permintaan.destroy", { id: key });
            const response = await axios.delete(url);
            messageApi.open({
                key: saveKey,
                content: "Berhasil menghapus pengguna ",
                type: "success",
            });
            router.get(
                route("permintaan"),
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

    const defaultColumns: ColumnsType<Permintaan> = [
        {
            title: "Id",
            dataIndex: "id",
        },
        {
            title: "Nomor Tiket",
            render: (_, record) => (
                <a
                    onClick={() => {
                        setOpenModalPesan(true);
                        setPermintaanId(record.id ?? 0);
                        setStatus(record.status);
                    }}
                >
                    {record.no_ticket}
                </a>
            ),
        },
        { title: "Nama Permintaan", dataIndex: "nama_permintaan" },
        { title: "Nama Item", dataIndex: "nama_item" },
        { title: "Kategori", dataIndex: "kategori" },
        { title: "Sub Kategori", dataIndex: "sub_kategori" },
        { title: "Ruangan", dataIndex: "nama_ruangan" },
        { title: "Nomor Telepon", dataIndex: "no_telp" },
        { title: "Deskripsi", dataIndex: "deskripsi" },
        { title: "Nama Pembuat", dataIndex: "users_nama" },
        { title: "Nama Admin", dataIndex: "user2_nama" },
        {
            title: "Status",
            render: (_, record) => (
                <>
                    {record.status === "open" ? (
                        <div
                            style={{
                                color: "white",
                                backgroundColor: "green",
                                padding: "5px 10px",
                                borderRadius: "5px",
                                fontSize: "12px",
                                textAlign: "center",
                                fontWeight: "bold",
                            }}
                        >
                            Open
                        </div>
                    ) : (
                        <div
                            style={{
                                color: "white",
                                backgroundColor: "red",
                                padding: "5px 10px",
                                borderRadius: "5px",
                                fontSize: "12px",
                                textAlign: "center",
                                fontWeight: "bold",
                            }}
                        >
                            Closed
                        </div>
                    )}
                </>
            ),
        },

        {
            title: "Aksi",
            render: (_, record) => (
                <>
                    {auth.user.role === "basic" ? null : (
                        <Button
                            onClick={() => {
                                setOpenModalUbah(true);
                                itemEditForm.setFieldsValue(record);
                            }}
                        >
                            <EditOutlined />
                            Edit
                        </Button>
                    )}

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
                </>
            ),
        },
    ];

    if (auth.user.role === "basic") {
        defaultColumns.splice(10, 1);
    }

    return (
        <Space direction="vertical" style={{ width: "100%" }}>
            <Head title="Daftar Permintaan" />
            <MyModal
                title={"Tambah Permintaan"}
                openModal={openModal}
                handleOk={handleOk}
                confirmLoadingModal={confirmLoadingModal}
                handleCancel={handleCancel}
                okText="Tambahkan"
                cancelText="Batal"
            >
                <PermintaanForm
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
                <PermintaanForm
                    form={itemEditForm}
                    onFinish={onFinishEdit}
                    type="edit"
                />
            </MyModal>
            <MyModal
                title=""
                openModal={openModalPesan}
                handleOk={() => {}}
                confirmLoadingModal={confirmLoadingModalPesan}
                handleCancel={handleCancelPesan}
                width={1180}
                footer={null}
            >
                <Message
                    permintaanId={permintaanId}
                    messages={messages}
                    handleSubmitPesan={submitPesan}
                    status={status}
                />
            </MyModal>
            <h1 className="tes">Daftar Permintaan</h1>
            <Divider />
            <Space style={{ display: "flex", justifyContent: "space-between" }}>
                <Search
                    placeholder="Cari pengguna ..."
                    allowClear
                    // onSearch={onSearch}
                    loading={searchLoading}
                    style={{ width: 200, marginBottom: "20px" }}
                />
                <Button
                    onClick={handleAdd}
                    type="primary"
                    style={{ marginBottom: 16 }}
                    icon={<PlusOutlined />}
                >
                    Tambah Permintaan
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
                dataSource={dataSource}
                // dataSource={dataSource.filter((item) =>
                //     Object.values(item)
                //         .join("")
                //         .toLowerCase()
                //         .includes(searchText.toLowerCase())
                // )}
                columns={defaultColumns}
            />
        </Space>
    );
};

Permintaan.layout = (
    page: ReactElement<any, JSXElementConstructor<any>> | ReactPortal
) => (
    <AuthenticatedLayout
        user={page.props.auth.user}
        header={<h2 className="">Kelola Permintaan</h2>}
        selectedKey="permintaan"
        children={page}
    ></AuthenticatedLayout>
);

export default Permintaan;
