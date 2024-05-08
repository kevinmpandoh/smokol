import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { Head, router } from "@inertiajs/react";

import {
    ReactElement,
    JSXElementConstructor,
    ReactPortal,
    useRef,
    useEffect,
    useState,
} from "react";
import {
    Input,
    Space,
    // Table,
    message,
    MenuProps,
    Menu,
    Card,
    Spin,
    Form,
    Select,
    Button,
} from "antd";

import PengajuanCard from "@/Components/PengajuanCard";
import MyModal from "@/Components/Modal";
import axios from "axios";

const { Search } = Input;

const KelolaPengajuanPage = () => {
    // console.log({ maintenance_list });

    const csrfMetaTag = document.querySelector('meta[name="csrf-token"]');
    const csrfToken = csrfMetaTag ? csrfMetaTag.getAttribute("content") : "";
    // console.log({ csrfTokenRef, csrfToken });
    const [searchText, setSearchText] = useState("");
    const [searchLoading, setSearchLoading] = useState(false);

    const [items, setItems] = useState([]);
    useEffect(() => {
        const fetchData = async () => {
            try {
                // Make a fetch request to your API endpoint
                setSearchLoading(true);
                const response = await fetch(
                    route("admin.pengajuan.fetch", { type: "99" })
                );
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                // Parse the JSON response
                const dataPengajuan = await response.json();

                // Update the state with the fetched items
                setItems(dataPengajuan.data);
                setSearchLoading(false);
            } catch (error) {
                console.error("Error fetching data:", error);
            }
        };

        // Call the fetch function when the component mounts
        fetchData();
        daftarStatusFetch();
    }, []);

    const verticalMenuItems: MenuProps["items"] = [
        {
            label: "Semua",
            key: "99",
        },
        {
            label: "Menunggu Persetujuan",
            key: "0",
        },
        // {
        //     label: "Diperiksa",
        //     key: "1",
        // },

        {
            label: "Menunggu Penyedia",
            key: "3",
        },
        {
            label: "Diproses Penyedia",
            key: "4",
        },
        {
            label: "Diperiksa Kembali",
            key: "5",
        },
        {
            label: "Selesai Diperiksa",
            key: "6",
        },
        {
            label: "Selesai",
            key: "9",
        },
    ];
    const [selectedVerticalMenu, setSelectedVerticalMenu] = useState("99");

    // data for current barang bast
    const fetchDataByType = async (type: string) => {
        try {
            // Make a fetch request to your API endpoint
            setSearchLoading(true);
            const response = await fetch(
                route("admin.pengajuan.fetch", { type: type })
            );
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            // Parse the JSON response
            const dataPengajuan = await response.json();
            console.log({ dataPengajuan });
            // Update the state with the fetched items
            setItems(dataPengajuan.data);
            setSearchLoading(false);
        } catch (error) {
            console.error("Error fetching data:", error);
        }
    };

    const fetchDataByQuery = async (querySearch: string, type: string) => {
        try {
            // Make a fetch request to your API endpoint
            setSearchLoading(true);
            const response = await fetch(
                route("admin.pengajuan.fetch", {
                    querySearch: querySearch ? querySearch : "",
                    type: type,
                })
            );
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            // Parse the JSON response
            const dataHasilSearch = await response.json();
            setSearchLoading(false);
            // Update the state with the fetched items
            setItems(dataHasilSearch.data);
        } catch (error) {
            console.error("Error fetching data:", error);
        }
    };

    const onSearch = async (value: string) => {
        // setSearchLoading(true);
        setSearchText(value);

        fetchDataByQuery(value, selectedVerticalMenu);
        // setSearchLoading(false);
    };

    // function handleVerticalMenuClick(event: any): MenuProps['onClick'] {

    // }
    const onPengajuanFilter = (values: any) => {
        // setFilter(value);
        fetchDataByQuery(values.keyword, values.kode_status);
    };
    const renderContent = () => {
        return <PengajuanCard items={items} csrfToken={csrfToken} />;
    };

    const Loading = () => (
        <Card
            style={{
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
            }}
        >
            <Spin />
        </Card>
    );
    const [pengajuanFilterForm] = Form.useForm();
    const [daftarStatus, setDaftarStatus] = useState([]);
    const daftarStatusFetch = async () => {
        const { data }: any | undefined = await axios.get(
            route("maintenance.status.fetch")
        );
        const daftarStatusResponse = data.map((status: any) => ({
            value: status.kode_status,
            label: status.deskripsi,
        }));
        setDaftarStatus(daftarStatusResponse);
    };
    return (
        <div>
            <Head title="History Barang" />
            <h1 style={{ marginBottom: "10px" }}>Daftar Pengajuan Pegawai</h1>
            {/* <Divider /> */}
            <Form
                form={pengajuanFilterForm}
                onFinish={onPengajuanFilter}
                style={{ width: "500px" }}
            >
                <Form.Item label={null} name="kode_status">
                    <Select
                        allowClear
                        options={daftarStatus}
                        placeholder="Filter berdasarkan status pengajuan"
                    />
                </Form.Item>
                <Form.Item label={null} name="keyword">
                    <Input
                        allowClear
                        placeholder="Cari berdasarakan nama pegawai atau nama barang, ataupun nomor urut pendaftaran"
                    />
                </Form.Item>
                <Button
                    type="primary"
                    onClick={() => pengajuanFilterForm.submit()}
                >
                    Terapkan filter
                </Button>
            </Form>

            {/* <Space
                style={{
                    marginBottom: "20px",
                    marginTop: "5px",
                    width: "100%",
                }}
                direction="vertical"
            >
                <Search
                    placeholder="Cari berdasarakan nama pegawai atau nama barang, ataupun nomor urut pendaftaran"
                    allowClear
                    onSearch={onSearch}
                    loading={searchLoading}
                    style={{ width: "100%" }}
                />
            </Space> */}
            {searchLoading ? Loading() : renderContent()}
        </div>
    );
};

KelolaPengajuanPage.layout = (
    page: ReactElement<any, JSXElementConstructor<any>> | ReactPortal
) => (
    <AuthenticatedLayout
        user={page.props.auth.user}
        header={<h2 className="">Pengajuan Saya</h2>}
        selectedKey="admin.kelola.pengajuan"
        children={page}
    ></AuthenticatedLayout>
);
export default KelolaPengajuanPage;
