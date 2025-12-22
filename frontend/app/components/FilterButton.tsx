'use client';

import React from "react";

interface buttonProps {
    onClick?: (event: React.MouseEvent<HTMLButtonElement>) => void;
    children: React.ReactNode;
    className?: string;
    disabled?: boolean;
    type?: 'button' | 'submit' | 'reset';
}

const Button: React.FC<buttonProps> = ({
    onClick,
    children,
    className,
    disabled,
    type = 'button',
}) => {
    return (
        <button
            onClick={onClick}
            className={className}
            disabled={disabled}
            type={type}
        >
            {children}
        </button>
    )
}

export default Button;