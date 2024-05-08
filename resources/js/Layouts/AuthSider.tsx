import ApplicationLogo from "@/Components/ApplicationLogo";
import { Menu, Space } from "antd";
import Sider from "antd/es/layout/Sider";
import {
    DashboardOutlined,
    BarChartOutlined,
    ShoppingOutlined,
    FileOutlined,
    UsergroupAddOutlined,
    DatabaseOutlined,
    FileDoneOutlined,
    HomeOutlined,
    DesktopOutlined,
    UserOutlined,
    CarOutlined,
    CarryOutFilled,
    CarryOutOutlined,
    ContainerOutlined,
} from "@ant-design/icons";
import { User } from "@/types";
type AuthSiderProps = {
    user: User;
    collapsed: boolean;
    selectedKey: string;
    handleMenuClick: (key: string) => void;
};

const AuthSider: React.FC<AuthSiderProps> = ({
    user,
    collapsed,
    selectedKey,
    handleMenuClick,
}) => {
    let menuItems = [
        {
            key: "dashboard",
            icon: <DashboardOutlined />,
            onClick: () => handleMenuClick("dashboard"),
            label: "Dashboard",
        },

        {
            key: "barang",
            icon: <ShoppingOutlined />,
            onClick: () => handleMenuClick("barang"),
            label: "Daftar Barang",
        },
        {
            key: "pengajuan",
            icon: <FileOutlined />,
            onClick: () => handleMenuClick("pengajuan"),
            label: "Daftar Pengajuan",
        },
        {
            key: "permintaan",
            icon: <ContainerOutlined />,
            label: "Permintaan",
            onClick: () => handleMenuClick("permintaan"),
        },
    ];
    if (user.role !== "basic") {
        menuItems = [
            {
                key: "dashboard",
                icon: <DashboardOutlined />,
                onClick: () => handleMenuClick("dashboard"),
                label: "Dashboard",
            },

            {
                key: "barang",
                icon: <ShoppingOutlined />,
                onClick: () => handleMenuClick("barang"),
                label: "Daftar Barang",
            },
            {
                key: "pengajuan",
                icon: <FileOutlined />,
                onClick: () => handleMenuClick("pengajuan"),
                label: "Daftar Pengajuan",
            },

            {
                key: "admin.kelola.history_barang.index",
                icon: <ShoppingOutlined />,
                label: "Kelola Barang",
                onClick: () =>
                    handleMenuClick("admin.kelola.history_barang.index"),
            },
            {
                key: "admin.kelola.pengajuan",
                icon: <FileDoneOutlined />,
                label: "Kelola Pengajuan",
                onClick: () => handleMenuClick("admin.kelola.pengajuan"),
            },
            {
                key: "admin.master.barang",
                icon: <DatabaseOutlined />,
                label: "Master Barang",
                onClick: () => handleMenuClick("admin.master.barang"),
            },
            {
                key: "admin.master.ruangan",
                icon: <HomeOutlined />,
                label: "Master Ruangan",
                onClick: () => handleMenuClick("admin.master.ruangan"),
            },
            {
                key: "admin.master.jabatan",
                icon: <CarryOutOutlined />,
                label: "Master Jabatan",
                onClick: () => handleMenuClick("admin.master.jabatan"),
            },
            {
                key: "admin.master.sistem_operasi.index",
                icon: <DesktopOutlined />,
                label: "Master Sistem Operasi",
                onClick: () => handleMenuClick("admin.master.sistem_operasi"),
            },
            {
                key: "admin.master.users",
                icon: <UserOutlined />,
                label: "Master Users",
                onClick: () => handleMenuClick("admin.master.users"),
            },
            {
                key: "permintaan",
                icon: <ContainerOutlined />,
                label: "Permintaan",
                onClick: () => handleMenuClick("permintaan"),
            },
        ];
    }
    return (
        <Sider trigger={null} collapsible collapsed={collapsed} theme="light">
            <div
                style={{
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "center",
                    padding: "16px",
                }}
            >
                <ApplicationLogo width="50px" preview={false} /> <br />
                <span
                    style={{
                        display: collapsed ? "none" : "block",
                        fontSize: "1.5rem",
                        fontFamily: "Roboto",
                        color: "#3219d4",
                        fontWeight: "bold",
                        marginLeft: "10px",
                    }}
                >
                    Smokol
                </span>
            </div>

            <Menu
                style={{ backgroundColor: "transparent", color: "#000" }}
                mode="inline"
                selectedKeys={[selectedKey]}
                items={menuItems}
            />
        </Sider>
    );
};

export default AuthSider;
