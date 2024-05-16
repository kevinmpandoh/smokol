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
import MasterBarangForm from "@/Forms/MasterBarangForm";
import { findSourceMap } from "module";

interface Item {
    key: string;
    jenis: string;
    merk: string;
    tipe: string;
    tahun_peroleh: string;
    nomor_seri: string;
}

interface DataType {
    key: React.Key;
    jenis: string;
    merk: string;
    tipe: string;
    tahun_peroleh: string;
    nomor_seri: string;
}
interface MasterBarang {
    id?: number;
    key?: number;
    jenis: string;
    tipe: string;
    merk: string;
    tahun_peroleh?: number | string | any;
    nomor_seri: string;
    nomor_urut_pendaftaran: string;
}

const { Search } = Input;
const MasterBarang = ({
    master_barang,
}: PageProps & { master_barang: MasterBarang[] }) => {
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
        setOpenModal(false);
        setConfirmLoadingModal(false);
    };
    const handleOkUbah = async () => {
        itemEditForm.submit();
        setOpenModalUbah(false);
        setConfirmLoadingModalUbah(false);
    };
    const handleCancel = () => {
        setOpenModal(false);
    };
    const handleCancelUbah = () => {
        setOpenModalUbah(false);
    };
    //end modal

    const data_master = master_barang.map(
        ({
            id,
            jenis,
            merk,
            tipe,
            tahun_peroleh,
            nomor_seri,
            nomor_urut_pendaftaran,
        }): MasterBarang => ({
            key: id,
            jenis,
            merk,
            tipe,
            tahun_peroleh,
            nomor_seri,
            nomor_urut_pendaftaran,
        })
    );
    const [dataSource, setDataSource] = useState<MasterBarang[]>(data_master);

    useEffect(() => {
        if (csrfTokenMeta) {
            csrfTokenRef.current = csrfTokenMeta.getAttribute("content");
        }
    }, []);
    useEffect(() => {
        setTimeout(() => {
            let data_master = master_barang.map(
                ({
                    id,
                    jenis,
                    merk,
                    tipe,
                    tahun_peroleh,
                    nomor_seri,
                    nomor_urut_pendaftaran,
                }) => ({
                    key: id,
                    jenis,
                    merk,
                    tipe,
                    tahun_peroleh,
                    nomor_seri,
                    nomor_urut_pendaftaran,
                })
            );

            console.log("changeeeee", { master_barang });
            setDataSource(data_master);
        }, 0);
    }, [master_barang]);

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
        router.delete(route("master_barang.destroy", { id: key }), {
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
    const onFinishAdd: (values: any) => any = (values: any) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang menambahkan data...",
            type: "loading",
        });
        try {
            router.post(route("master_barang.store"), values, {
                onSuccess: (responsePage) => {
                    const response: any = responsePage.props.response;
                    console.log({ response });
                    if (response.errors?.length > 1) {
                        return messageApi.open({
                            key: saveKey,
                            content: response.errors,
                            type: "error",
                        });
                    }
                    messageApi.open({
                        key: saveKey,
                        content: "Berhasil menambahkan data",
                        type: "success",
                    });

                    return 1;
                },
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
    const onFinishEdit: (values: any) => any = (values: any) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang menambahkan data...",
            type: "loading",
        });
        console.log("OK");
        try {
            console.log(values);
            router.patch(route("master_barang.update"), values, {
                onSuccess: (responsePage) => {
                    const response: any = responsePage.props.response;
                    console.log({ response });
                    if (response.errors?.length > 1) {
                        return messageApi.open({
                            key: saveKey,
                            content: response.errors,
                            type: "error",
                        });
                    }
                    messageApi.open({
                        key: saveKey,
                        content: "Berhasil menyimpan perubahan data",
                        type: "success",
                    });

                    return 1;
                },
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
    const jenisSorter: Sorter<MasterBarang> = createSorter("jenis");
    const tipeSorter: Sorter<MasterBarang> = createSorter("tipe");
    const merkSorter: Sorter<MasterBarang> = createSorter("merk");
    const nomorSeriSorter: Sorter<MasterBarang> = createSorter("nomor_seri");
    const nupSorter: Sorter<MasterBarang> = createSorter(
        "nomor_urut_pendaftaran"
    );
    const tahunPerolehSorter: Sorter<MasterBarang> =
        createSorter("tahun_peroleh");
    interface Column {
        key?: React.Key;
        title: string;
        dataIndex: string;
        sorter?: CompareFn<object>;
        editable?: boolean;
        filters?: ColumnFilterItem[];
        onCell?: (record: DataType) => object;
        render?: (value: any, record: MasterBarang) => React.ReactNode;
    }

    const defaultColumns: ColumnsType<MasterBarang> = [
        {
            title: "jenis",
            dataIndex: "jenis",
            filters: [
                {
                    text: "PC",
                    value: "PC",
                },
            ],
            sorter: jenisSorter as CompareFn<object>,
        },
        {
            title: "merk",
            dataIndex: "merk",
            sorter: merkSorter as CompareFn<object>,
        },
        {
            title: "tipe",
            dataIndex: "tipe",
            sorter: tipeSorter as CompareFn<object>,
        },
        {
            title: "tahun_peroleh",
            dataIndex: "tahun_peroleh",
            render: (value: any) =>
                // new Intl.DateTimeFormat("en-GB", {
                //     day: "numeric",
                //     month: "short",
                //     year: "numeric",
                // }).format(new Date(value)),
                value,
        },
        {
            title: "Nomor Urut Pendaftaran (NUP)",
            dataIndex: "nomor_urut_pendaftaran",
            sorter: nupSorter as CompareFn<object>,
        },
        {
            title: "nomor_seri",
            dataIndex: "nomor_seri",
            sorter: nomorSeriSorter as CompareFn<object>,
        },
        {
            title: "edit",
            render: (_, record) => (
                <Button
                    onClick={() => {
                        setOpenModalUbah(true);

                        // itemEditForm.setFieldsValue(record);
                        itemEditForm.setFieldValue("id", record.key);
                        itemEditForm.setFieldValue("jenis", record.jenis);
                        itemEditForm.setFieldValue("merk", record.merk);
                        itemEditForm.setFieldValue("tipe", record.tipe);
                        itemEditForm.setFieldValue(
                            "tahun_peroleh",
                            dayjs(record.tahun_peroleh)
                        );
                        itemEditForm.setFieldValue(
                            "nomor_urut_pendaftaran",
                            record.nomor_urut_pendaftaran
                        );
                        itemEditForm.setFieldValue(
                            "nomor_seri",
                            record.nomor_seri
                        );
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
            <Head title="Master Barang" />
            <MyModal
                title={"Tambah Master Barang"}
                openModal={openModal}
                handleOk={handleOk}
                confirmLoadingModal={confirmLoadingModal}
                handleCancel={handleCancel}
                okText="Tambahkan"
                cancelText="Batal"
            >
                <Divider />
                <MasterBarangForm form={itemAddForm} onFinish={onFinishAdd} />
            </MyModal>
            <MyModal
                title={"Ubah Master Barang"}
                openModal={openModalUbah}
                handleOk={handleOkUbah}
                confirmLoadingModal={confirmLoadingModalUbah}
                handleCancel={handleCancelUbah}
                okText="Simpan"
                cancelText="Batal"
            >
                <Divider />
                <MasterBarangForm form={itemEditForm} onFinish={onFinishEdit} />
            </MyModal>

            {contextHolder}
            <h1>Master Barang</h1>
            <Divider />
            <Space style={{ display: "flex", justifyContent: "space-between" }}>
                <Search
                    placeholder="Cari barang ..."
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
                    Tambah Barang
                </Button>
            </Space>
            <Table
                style={{
                    width: "100%",
                    overflowX: "auto",
                    backgroundColor: "#fff",
                }}
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

MasterBarang.layout = (
    page: ReactElement<any, JSXElementConstructor<any>> | ReactPortal
) => (
    <AuthenticatedLayout
        user={page.props.auth.user}
        header={<h2 className="">Master Barang</h2>}
        selectedKey="admin.master.barang"
        children={page}
    ></AuthenticatedLayout>
);
export default MasterBarang;
