import React, { PropsWithChildren, useState } from "react";
import { Button, Divider, Modal } from "antd";

interface ModalProps {
    title: string;
    openModal: boolean;
    handleOk: () => void;
    confirmLoadingModal: boolean;
    handleCancel: () => void;
    okText?: string;
    cancelText?: string;
    maskClosable?: boolean;
    width?: number | string;
    footer?: React.ReactNode;
    ticket?: any;
}
const MyModal = ({
    title,
    openModal,
    handleOk,
    confirmLoadingModal,
    handleCancel,
    okText,
    cancelText,
    width,
    maskClosable,
    children,
    footer,
}: PropsWithChildren<ModalProps>) => {
    return (
        <Modal
            title={title}
            open={openModal}
            onOk={handleOk}
            confirmLoading={confirmLoadingModal}
            onCancel={handleCancel}
            cancelText={cancelText}
            okText={okText}
            mask={true}
            maskClosable={maskClosable}
            width={width}
            footer={footer}
        >
            <Divider />
            {children}
        </Modal>
    );
};

export default MyModal;
