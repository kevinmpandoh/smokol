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
import MasterRuanganForm from "@/Forms/MasterRuanganForm";
import { findSourceMap } from "module";
import axios from "axios";

interface DataType {
    key: React.Key;
    nama: string;
}
interface MasterRuangan {
    id?: number;
    key?: number;
    nama: string;
    users_id: number;
    users_nama: string;
    kode_baru: string;
    kode_siman: string;
    gedung: string;
    lantai: string | null;
}

const { Search } = Input;
const MasterRuangan = ({
    master_ruangan,
}: PageProps & { master_ruangan: MasterRuangan[] }) => {
    // console.log({ master_ruangan });
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
        setOpenModal(false);
        setConfirmLoadingModal(false);
    };
    const handleOkUbah = async () => {
        try {
            const isValid = itemEditForm.validateFields();
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

    const [dataSource, setDataSource] = useState<MasterRuangan[]>([]);

    useEffect(() => {
        setTimeout(() => {
            let data_master = master_ruangan.map(
                ({
                    id,
                    nama,
                    users_id,
                    users_nama,
                    kode_siman,
                    lantai,
                    gedung,
                    kode_baru,
                }) => ({
                    key: id,
                    nama,
                    users_id,
                    users_nama,
                    kode_siman,
                    lantai,
                    gedung,
                    kode_baru,
                })
            );

            setDataSource(data_master);
        }, 0);
    }, [master_ruangan]);

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
    function handleDelete(key: React.Key | string): void {
        if (key === 0) return;
        router.delete(route("master_ruangan.destroy", { id: key }), {
            // method: "delete",
            preserveState: true,
            preserveScroll: true,
            onStart: () =>
                messageApi.open({
                    key: saveKey,
                    content: "Menghapus dari master",
                    type: "loading",
                }),
            onSuccess: (responsePage) => {
                console.log({ responsePage });
                const response: any = responsePage.props.response;
                if (response.errors?.length > 1) {
                    return messageApi.open({
                        key: saveKey,
                        content: response.errors,
                        type: "error",
                    });
                }
                messageApi.open({
                    key: saveKey,
                    content: "Berhasil menghapus data",
                    type: "success",
                });
                return 1;
            },
            onFinish: () => {},

            onError: (event) => console.log(`Error! ${event}`),
        });
    }
    const onFinishAdd: (values: any) => any = async (values: any) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang menambahkan data...",
            type: "loading",
        });
        try {
            const url = route("master_ruangan.store");
            const { data } = await axios.post(url, values, {
                headers: {
                    "Content-Type": "application/json",
                },
            });
            messageApi.open({
                key: saveKey,
                content: "Berhasil menambahkan data",
                type: "success",
            });
        } catch (error: any) {
            messageApi.open({
                key: saveKey,
                content: error.message,
                type: "error",
            });
            return 0;
        }
    };
    const onFinishEdit: (values: any) => any = async (values: any) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang menambahkan data...",
            type: "loading",
        });
        try {
            const url = route("master_ruangan.update");
            const { data } = await axios.patch(url, values, {
                headers: {
                    "Content-Type": "application/json",
                },
            });
            messageApi.open({
                key: saveKey,
                content: "Berhasil menyimpan perubahan",
                type: "success",
            });

            router.get(
                route("admin.master.ruangan"),
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
    const namaSorter: Sorter<MasterRuangan> = createSorter("nama");

    interface Column {
        key?: React.Key;
        title: string;
        dataIndex: string;
        sorter?: CompareFn<object>;
        editable?: boolean;
        filters?: ColumnFilterItem[];
        onCell?: (record: DataType) => object;
        render?: (value: any, record: MasterRuangan) => React.ReactNode;
    }

    const defaultColumns: ColumnsType<MasterRuangan> = [
        {
            title: "Id",
            dataIndex: "key",

            // sorter: namaSorter as CompareFn<object>,
        },
        {
            title: "Nama Ruangan",
            dataIndex: "nama",
        },
        {
            title: "Kode Siman",
            dataIndex: "kode_siman",
        },
        {
            title: "Kode Baru",
            dataIndex: "kode_baru",
        },
        {
            title: "Gedung",
            dataIndex: "gedung",
        },
        {
            title: "Lantai",
            dataIndex: "lantai",
        },

        {
            title: "Nama penanggung jawab ruangan",
            dataIndex: "users_nama",

            // sorter: namaSorter as CompareFn<object>,
        },
        {
            title: "Aksi",
            render: (_, record) => (
                <>
                    <Button
                        onClick={() => {
                            setOpenModalUbah(true);

                            itemEditForm.setFieldsValue(record);
                            itemEditForm.setFieldValue("id", record.key);
                            itemEditForm.setFieldValue(
                                "users_id",
                                record.users_id
                            );
                            itemEditForm.setFieldValue(
                                "kode_siman",
                                record.kode_siman
                            );
                            itemEditForm.setFieldValue(
                                "kode_baru",
                                record.kode_baru
                            );
                            itemEditForm.setFieldValue("gedung", record.gedung);
                            itemEditForm.setFieldValue("lantai", record.lantai);
                        }}
                    >
                        <EditOutlined />
                        edit
                    </Button>

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

    return (
        <div>
            <Head title="Master Ruangan" />
            <MyModal
                title={"Tambah Master Ruangan"}
                openModal={openModal}
                handleOk={handleOk}
                confirmLoadingModal={confirmLoadingModal}
                handleCancel={handleCancel}
                okText="Tambahkan"
                cancelText="Batal"
            >
                <Divider />
                <MasterRuanganForm form={itemAddForm} onFinish={onFinishAdd} />
            </MyModal>
            <MyModal
                title={"Ubah Master Ruangan"}
                openModal={openModalUbah}
                handleOk={handleOkUbah}
                confirmLoadingModal={confirmLoadingModalUbah}
                handleCancel={handleCancelUbah}
                okText="Simpan"
                cancelText="Batal"
            >
                <Divider />
                <MasterRuanganForm
                    form={itemEditForm}
                    onFinish={onFinishEdit}
                />
            </MyModal>

            {contextHolder}
            <h1>Master Ruangan</h1>
            <Divider />
            <Space style={{ display: "flex", justifyContent: "space-between" }}>
                <Search
                    placeholder="Cari ruangan ..."
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
                    Tambah Ruangan
                </Button>
            </Space>

            <Table
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
        </div>
    );
};

MasterRuangan.layout = (
    page: ReactElement<any, JSXElementConstructor<any>> | ReactPortal
) => (
    <AuthenticatedLayout
        user={page.props.auth.user}
        header={<h2 className="">Master Ruangan</h2>}
        selectedKey="admin.master.ruangan"
        children={page}
    ></AuthenticatedLayout>
);
export default MasterRuangan;
