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
import MasterSistemOperasiForm from "@/Forms/MasterSistemOperasiForm";
import { findSourceMap } from "module";

interface DataType {
    key: React.Key;
    nama: string;
    tingkat: string;
}
interface MasterSistemOperasi {
    id?: number;
    key?: number;
    nama: string;
    arsitektur: string;
}

const { Search } = Input;
const MasterSistemOperasi = ({
    master_sistem_operasi,
}: PageProps & { master_sistem_operasi: MasterSistemOperasi[] }) => {
    const [searchText, setSearchText] = useState("");
    const [searchLoading, setSearchLoading] = useState(false);
    const [messageApi, contextHolder] = message.useMessage();
    const saveKey = "updatable";
    const [itemAddForm] = Form.useForm();

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
        itemAddForm.submit();
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

    const data_master = master_sistem_operasi.map(
        ({ id, nama, arsitektur }): MasterSistemOperasi => ({
            key: id,
            nama,
            arsitektur,
        })
    );
    const [dataSource, setDataSource] =
        useState<MasterSistemOperasi[]>(data_master);

    useEffect(() => {
        setTimeout(() => {
            let data_master = master_sistem_operasi.map(
                ({ id, nama, arsitektur }) => ({
                    key: id,
                    nama,
                    arsitektur,
                })
            );

            setDataSource(data_master);
        }, 0);
    }, [master_sistem_operasi]);

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
        router.delete(
            route("admin.master.sistem_operasi.destroy", { id: key }),
            {
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
            }
        );
    }
    const onFinishAdd: (values: any) => any = (values: any) => {
        messageApi.open({
            key: saveKey,
            content: "Sedang menambahkan data...",
            type: "loading",
        });
        try {
            router.post(route("admin.master.sistem_operasi.store"), values, {
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
        try {
            router.patch(route("admin.master.sistem_operasi.update"), values, {
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
    const namaSorter: Sorter<MasterSistemOperasi> = createSorter("nama");
    const arsitekturSorter: Sorter<MasterSistemOperasi> =
        createSorter("arsitektur");

    interface Column {
        key?: React.Key;
        title: string;
        dataIndex: string;
        sorter?: CompareFn<object>;
        editable?: boolean;
        filters?: ColumnFilterItem[];
        onCell?: (record: DataType) => object;
        render?: (value: any, record: MasterSistemOperasi) => React.ReactNode;
    }

    const defaultColumns: ColumnsType<MasterSistemOperasi> = [
        {
            title: "nama",
            dataIndex: "nama",

            sorter: namaSorter as CompareFn<object>,
        },
        {
            title: "arsitektur",
            dataIndex: "arsitektur",
            sorter: arsitekturSorter as CompareFn<object>,
        },

        {
            title: "operation",
            dataIndex: "operation",
            render: (_, record: MasterSistemOperasi) => {
                const items: MenuProps["items"] = [
                    {
                        label: (
                            <a>
                                <EditOutlined /> Ubah
                            </a>
                        ),
                        key: "0",
                        onClick: () => {
                            setOpenModalUbah(true);

                            itemAddForm.setFieldsValue(record);
                            itemAddForm.setFieldValue("id", record.key);
                        },
                    },
                    {
                        label: (
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
                        ),
                        key: "1",
                    },
                ];
                return dataSource.length >= 1 ? (
                    <Dropdown
                        menu={{ items }}
                        trigger={["hover"]}
                        placement="bottomRight"
                    >
                        <Button
                            style={{
                                color: "#fff",
                            }}
                            onClick={(e) => e.preventDefault()}
                            type="primary"
                        >
                            <Space>
                                Aksi
                                <CaretDownOutlined />
                            </Space>
                        </Button>
                    </Dropdown>
                ) : null;
            },
        },
    ];

    return (
        <div>
            <Head title="Master Sistem Operasi" />
            <MyModal
                title={"Tambah Master Sistem Operasi"}
                openModal={openModal}
                handleOk={handleOk}
                confirmLoadingModal={confirmLoadingModal}
                handleCancel={handleCancel}
                okText="Tambahkan"
                cancelText="Batal"
            >
                <Divider />
                <MasterSistemOperasiForm
                    form={itemAddForm}
                    onFinish={onFinishAdd}
                />
            </MyModal>
            <MyModal
                title={"Ubah Master Sistem Operasi"}
                openModal={openModalUbah}
                handleOk={handleOkUbah}
                confirmLoadingModal={confirmLoadingModalUbah}
                handleCancel={handleCancelUbah}
                okText="Simpan"
                cancelText="Batal"
            >
                <Divider />
                <MasterSistemOperasiForm
                    form={itemAddForm}
                    onFinish={onFinishEdit}
                />
            </MyModal>

            {contextHolder}
            <h1>Master Sistem Operasi</h1>
            <Divider />
            <Space style={{ display: "flex", justifyContent: "space-between" }}>
                <Search
                    placeholder="Cari Sistem Operasi ..."
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
                    Add a row
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

MasterSistemOperasi.layout = (
    page: ReactElement<any, JSXElementConstructor<any>> | ReactPortal
) => (
    <AuthenticatedLayout
        user={page.props.auth.user}
        header={<h2 className="">Master Sistem Operasi</h2>}
        selectedKey="admin.master.sistem_operasi.index"
        children={page}
    ></AuthenticatedLayout>
);
export default MasterSistemOperasi;
