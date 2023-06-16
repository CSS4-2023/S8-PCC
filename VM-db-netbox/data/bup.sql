--
-- PostgreSQL database dump
--

-- Dumped from database version 13.11 (Debian 13.11-0+deb11u1)
-- Dumped by pg_dump version 13.11 (Debian 13.11-0+deb11u1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO netbox;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO netbox;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO netbox;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO netbox;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO netbox;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO netbox;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO netbox;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO netbox;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO netbox;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO netbox;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO netbox;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO netbox;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: circuits_circuit; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuit (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    cid character varying(100) NOT NULL,
    status character varying(50) NOT NULL,
    install_date date,
    commit_rate integer,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    provider_id bigint NOT NULL,
    tenant_id bigint,
    termination_a_id bigint,
    termination_z_id bigint,
    type_id bigint NOT NULL,
    CONSTRAINT circuits_circuit_commit_rate_check CHECK ((commit_rate >= 0))
);


ALTER TABLE public.circuits_circuit OWNER TO netbox;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuit_id_seq OWNER TO netbox;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuit_id_seq OWNED BY public.circuits_circuit.id;


--
-- Name: circuits_circuittermination; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuittermination (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    term_side character varying(1) NOT NULL,
    port_speed integer,
    upstream_speed integer,
    xconnect_id character varying(50) NOT NULL,
    pp_info character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_type_id integer,
    cable_id bigint,
    circuit_id bigint NOT NULL,
    provider_network_id bigint,
    site_id bigint,
    CONSTRAINT circuits_circuittermination__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT circuits_circuittermination_port_speed_check CHECK ((port_speed >= 0)),
    CONSTRAINT circuits_circuittermination_upstream_speed_check CHECK ((upstream_speed >= 0))
);


ALTER TABLE public.circuits_circuittermination OWNER TO netbox;

--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuittermination_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuittermination_id_seq OWNER TO netbox;

--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuittermination_id_seq OWNED BY public.circuits_circuittermination.id;


--
-- Name: circuits_circuittype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuittype (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.circuits_circuittype OWNER TO netbox;

--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuittype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuittype_id_seq OWNER TO netbox;

--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuittype_id_seq OWNED BY public.circuits_circuittype.id;


--
-- Name: circuits_provider; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_provider (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    asn bigint,
    account character varying(30) NOT NULL,
    portal_url character varying(200) NOT NULL,
    noc_contact text NOT NULL,
    admin_contact text NOT NULL,
    comments text NOT NULL
);


ALTER TABLE public.circuits_provider OWNER TO netbox;

--
-- Name: circuits_provider_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_provider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_provider_id_seq OWNER TO netbox;

--
-- Name: circuits_provider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_provider_id_seq OWNED BY public.circuits_provider.id;


--
-- Name: circuits_providernetwork; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_providernetwork (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    provider_id bigint NOT NULL
);


ALTER TABLE public.circuits_providernetwork OWNER TO netbox;

--
-- Name: circuits_providernetwork_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_providernetwork_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_providernetwork_id_seq OWNER TO netbox;

--
-- Name: circuits_providernetwork_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_providernetwork_id_seq OWNED BY public.circuits_providernetwork.id;


--
-- Name: dcim_cable; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_cable (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    termination_a_id integer NOT NULL,
    termination_b_id integer NOT NULL,
    type character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    label character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    length numeric(8,2),
    length_unit character varying(50) NOT NULL,
    _abs_length numeric(10,4),
    _termination_a_device_id bigint,
    _termination_b_device_id bigint,
    termination_a_type_id integer NOT NULL,
    termination_b_type_id integer NOT NULL,
    CONSTRAINT dcim_cable_termination_a_id_check CHECK ((termination_a_id >= 0)),
    CONSTRAINT dcim_cable_termination_b_id_check CHECK ((termination_b_id >= 0))
);


ALTER TABLE public.dcim_cable OWNER TO netbox;

--
-- Name: dcim_cable_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_cable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_cable_id_seq OWNER TO netbox;

--
-- Name: dcim_cable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_cable_id_seq OWNED BY public.dcim_cable.id;


--
-- Name: dcim_cablepath; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_cablepath (
    id bigint NOT NULL,
    origin_id integer NOT NULL,
    destination_id integer,
    path character varying(40)[] NOT NULL,
    is_active boolean NOT NULL,
    is_split boolean NOT NULL,
    destination_type_id integer,
    origin_type_id integer NOT NULL,
    CONSTRAINT dcim_cablepath_destination_id_check CHECK ((destination_id >= 0)),
    CONSTRAINT dcim_cablepath_origin_id_check CHECK ((origin_id >= 0))
);


ALTER TABLE public.dcim_cablepath OWNER TO netbox;

--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_cablepath_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_cablepath_id_seq OWNER TO netbox;

--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_cablepath_id_seq OWNED BY public.dcim_cablepath.id;


--
-- Name: dcim_consoleport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleport (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    speed integer,
    _cable_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    CONSTRAINT dcim_consoleport__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_consoleport_speed_check CHECK ((speed >= 0))
);


ALTER TABLE public.dcim_consoleport OWNER TO netbox;

--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleport_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleport_id_seq OWNED BY public.dcim_consoleport.id;


--
-- Name: dcim_consoleporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleporttemplate (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    device_type_id bigint NOT NULL
);


ALTER TABLE public.dcim_consoleporttemplate OWNER TO netbox;

--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleporttemplate_id_seq OWNED BY public.dcim_consoleporttemplate.id;


--
-- Name: dcim_consoleserverport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleserverport (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    speed integer,
    _cable_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    CONSTRAINT dcim_consoleserverport__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_consoleserverport_speed_check CHECK ((speed >= 0))
);


ALTER TABLE public.dcim_consoleserverport OWNER TO netbox;

--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleserverport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleserverport_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleserverport_id_seq OWNED BY public.dcim_consoleserverport.id;


--
-- Name: dcim_consoleserverporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleserverporttemplate (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    device_type_id bigint NOT NULL
);


ALTER TABLE public.dcim_consoleserverporttemplate OWNER TO netbox;

--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleserverporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleserverporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleserverporttemplate_id_seq OWNED BY public.dcim_consoleserverporttemplate.id;


--
-- Name: dcim_device; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_device (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    local_context_data jsonb,
    name character varying(64),
    _name character varying(100),
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    "position" smallint,
    face character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    vc_position smallint,
    vc_priority smallint,
    comments text NOT NULL,
    cluster_id bigint,
    device_role_id bigint NOT NULL,
    device_type_id bigint NOT NULL,
    location_id bigint,
    platform_id bigint,
    primary_ip4_id bigint,
    primary_ip6_id bigint,
    rack_id bigint,
    site_id bigint NOT NULL,
    tenant_id bigint,
    virtual_chassis_id bigint,
    CONSTRAINT dcim_device_position_check CHECK (("position" >= 0)),
    CONSTRAINT dcim_device_vc_position_check CHECK ((vc_position >= 0)),
    CONSTRAINT dcim_device_vc_priority_check CHECK ((vc_priority >= 0))
);


ALTER TABLE public.dcim_device OWNER TO netbox;

--
-- Name: dcim_device_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_device_id_seq OWNER TO netbox;

--
-- Name: dcim_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_device_id_seq OWNED BY public.dcim_device.id;


--
-- Name: dcim_devicebay; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicebay (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    device_id bigint NOT NULL,
    installed_device_id bigint
);


ALTER TABLE public.dcim_devicebay OWNER TO netbox;

--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicebay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicebay_id_seq OWNER TO netbox;

--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicebay_id_seq OWNED BY public.dcim_devicebay.id;


--
-- Name: dcim_devicebaytemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicebaytemplate (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    device_type_id bigint NOT NULL
);


ALTER TABLE public.dcim_devicebaytemplate OWNER TO netbox;

--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicebaytemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicebaytemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicebaytemplate_id_seq OWNED BY public.dcim_devicebaytemplate.id;


--
-- Name: dcim_devicerole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicerole (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    vm_role boolean NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_devicerole OWNER TO netbox;

--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicerole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicerole_id_seq OWNER TO netbox;

--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicerole_id_seq OWNED BY public.dcim_devicerole.id;


--
-- Name: dcim_devicetype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicetype (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    model character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    part_number character varying(50) NOT NULL,
    u_height smallint NOT NULL,
    is_full_depth boolean NOT NULL,
    subdevice_role character varying(50) NOT NULL,
    front_image character varying(100) NOT NULL,
    rear_image character varying(100) NOT NULL,
    comments text NOT NULL,
    manufacturer_id bigint NOT NULL,
    CONSTRAINT dcim_devicetype_u_height_check CHECK ((u_height >= 0))
);


ALTER TABLE public.dcim_devicetype OWNER TO netbox;

--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicetype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicetype_id_seq OWNER TO netbox;

--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicetype_id_seq OWNED BY public.dcim_devicetype.id;


--
-- Name: dcim_frontport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_frontport (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    _cable_peer_type_id integer,
    cable_id bigint,
    device_id bigint NOT NULL,
    rear_port_id bigint NOT NULL,
    color character varying(6) NOT NULL,
    CONSTRAINT dcim_frontport__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_frontport_rear_port_position_check CHECK ((rear_port_position >= 0))
);


ALTER TABLE public.dcim_frontport OWNER TO netbox;

--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_frontport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_frontport_id_seq OWNER TO netbox;

--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_frontport_id_seq OWNED BY public.dcim_frontport.id;


--
-- Name: dcim_frontporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_frontporttemplate (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    device_type_id bigint NOT NULL,
    rear_port_id bigint NOT NULL,
    color character varying(6) NOT NULL,
    CONSTRAINT dcim_frontporttemplate_rear_port_position_check CHECK ((rear_port_position >= 0))
);


ALTER TABLE public.dcim_frontporttemplate OWNER TO netbox;

--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_frontporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_frontporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_frontporttemplate_id_seq OWNED BY public.dcim_frontporttemplate.id;


--
-- Name: dcim_interface; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    enabled boolean NOT NULL,
    mac_address macaddr,
    mtu integer,
    mode character varying(50) NOT NULL,
    _name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    _cable_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    lag_id bigint,
    parent_id bigint,
    untagged_vlan_id bigint,
    CONSTRAINT dcim_interface__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_interface_mtu_check CHECK ((mtu >= 0))
);


ALTER TABLE public.dcim_interface OWNER TO netbox;

--
-- Name: dcim_interface_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_id_seq OWNED BY public.dcim_interface.id;


--
-- Name: dcim_interface_tagged_vlans; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface_tagged_vlans (
    id integer NOT NULL,
    interface_id bigint NOT NULL,
    vlan_id bigint NOT NULL
);


ALTER TABLE public.dcim_interface_tagged_vlans OWNER TO netbox;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_tagged_vlans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_tagged_vlans_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_tagged_vlans_id_seq OWNED BY public.dcim_interface_tagged_vlans.id;


--
-- Name: dcim_interfacetemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interfacetemplate (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    device_type_id bigint NOT NULL
);


ALTER TABLE public.dcim_interfacetemplate OWNER TO netbox;

--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interfacetemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interfacetemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interfacetemplate_id_seq OWNED BY public.dcim_interfacetemplate.id;


--
-- Name: dcim_inventoryitem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_inventoryitem (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    part_id character varying(50) NOT NULL,
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    discovered boolean NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    device_id bigint NOT NULL,
    manufacturer_id bigint,
    parent_id bigint,
    CONSTRAINT dcim_inventoryitem_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_inventoryitem_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_inventoryitem_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_inventoryitem_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_inventoryitem OWNER TO netbox;

--
-- Name: dcim_inventoryitem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_inventoryitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_inventoryitem_id_seq OWNER TO netbox;

--
-- Name: dcim_inventoryitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_inventoryitem_id_seq OWNED BY public.dcim_inventoryitem.id;


--
-- Name: dcim_location; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_location (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    site_id bigint NOT NULL,
    CONSTRAINT dcim_location_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_location_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_location_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_location_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_location OWNER TO netbox;

--
-- Name: dcim_location_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_location_id_seq OWNER TO netbox;

--
-- Name: dcim_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_location_id_seq OWNED BY public.dcim_location.id;


--
-- Name: dcim_manufacturer; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_manufacturer (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_manufacturer OWNER TO netbox;

--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_manufacturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_manufacturer_id_seq OWNER TO netbox;

--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_manufacturer_id_seq OWNED BY public.dcim_manufacturer.id;


--
-- Name: dcim_platform; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_platform (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    napalm_driver character varying(50) NOT NULL,
    napalm_args jsonb,
    description character varying(200) NOT NULL,
    manufacturer_id bigint
);


ALTER TABLE public.dcim_platform OWNER TO netbox;

--
-- Name: dcim_platform_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_platform_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_platform_id_seq OWNER TO netbox;

--
-- Name: dcim_platform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_platform_id_seq OWNED BY public.dcim_platform.id;


--
-- Name: dcim_powerfeed; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerfeed (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    name character varying(100) NOT NULL,
    status character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    supply character varying(50) NOT NULL,
    phase character varying(50) NOT NULL,
    voltage smallint NOT NULL,
    amperage smallint NOT NULL,
    max_utilization smallint NOT NULL,
    available_power integer NOT NULL,
    comments text NOT NULL,
    _cable_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    power_panel_id bigint NOT NULL,
    rack_id bigint,
    CONSTRAINT dcim_powerfeed__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_powerfeed_amperage_check CHECK ((amperage >= 0)),
    CONSTRAINT dcim_powerfeed_available_power_check CHECK ((available_power >= 0)),
    CONSTRAINT dcim_powerfeed_max_utilization_check CHECK ((max_utilization >= 0))
);


ALTER TABLE public.dcim_powerfeed OWNER TO netbox;

--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerfeed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerfeed_id_seq OWNER TO netbox;

--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerfeed_id_seq OWNED BY public.dcim_powerfeed.id;


--
-- Name: dcim_poweroutlet; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_poweroutlet (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    feed_leg character varying(50) NOT NULL,
    _cable_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    power_port_id bigint,
    CONSTRAINT dcim_poweroutlet__cable_peer_id_check CHECK ((_cable_peer_id >= 0))
);


ALTER TABLE public.dcim_poweroutlet OWNER TO netbox;

--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_poweroutlet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_poweroutlet_id_seq OWNER TO netbox;

--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_poweroutlet_id_seq OWNED BY public.dcim_poweroutlet.id;


--
-- Name: dcim_poweroutlettemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_poweroutlettemplate (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    feed_leg character varying(50) NOT NULL,
    device_type_id bigint NOT NULL,
    power_port_id bigint
);


ALTER TABLE public.dcim_poweroutlettemplate OWNER TO netbox;

--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_poweroutlettemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_poweroutlettemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_poweroutlettemplate_id_seq OWNED BY public.dcim_poweroutlettemplate.id;


--
-- Name: dcim_powerpanel; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerpanel (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    location_id bigint,
    site_id bigint NOT NULL
);


ALTER TABLE public.dcim_powerpanel OWNER TO netbox;

--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerpanel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerpanel_id_seq OWNER TO netbox;

--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerpanel_id_seq OWNED BY public.dcim_powerpanel.id;


--
-- Name: dcim_powerport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerport (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    maximum_draw smallint,
    allocated_draw smallint,
    _cable_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    CONSTRAINT dcim_powerport__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_powerport_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerport_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerport OWNER TO netbox;

--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerport_id_seq OWNER TO netbox;

--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerport_id_seq OWNED BY public.dcim_powerport.id;


--
-- Name: dcim_powerporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerporttemplate (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    maximum_draw smallint,
    allocated_draw smallint,
    device_type_id bigint NOT NULL,
    CONSTRAINT dcim_powerporttemplate_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerporttemplate_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerporttemplate OWNER TO netbox;

--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerporttemplate_id_seq OWNED BY public.dcim_powerporttemplate.id;


--
-- Name: dcim_rack; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rack (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    _name character varying(100) NOT NULL,
    facility_id character varying(50),
    status character varying(50) NOT NULL,
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    type character varying(50) NOT NULL,
    width smallint NOT NULL,
    u_height smallint NOT NULL,
    desc_units boolean NOT NULL,
    outer_width smallint,
    outer_depth smallint,
    outer_unit character varying(50) NOT NULL,
    comments text NOT NULL,
    location_id bigint,
    role_id bigint,
    site_id bigint NOT NULL,
    tenant_id bigint,
    CONSTRAINT dcim_rack_outer_depth_check CHECK ((outer_depth >= 0)),
    CONSTRAINT dcim_rack_outer_width_check CHECK ((outer_width >= 0)),
    CONSTRAINT dcim_rack_u_height_check CHECK ((u_height >= 0)),
    CONSTRAINT dcim_rack_width_check CHECK ((width >= 0))
);


ALTER TABLE public.dcim_rack OWNER TO netbox;

--
-- Name: dcim_rack_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rack_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rack_id_seq OWNER TO netbox;

--
-- Name: dcim_rack_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rack_id_seq OWNED BY public.dcim_rack.id;


--
-- Name: dcim_rackreservation; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackreservation (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    units smallint[] NOT NULL,
    description character varying(200) NOT NULL,
    rack_id bigint NOT NULL,
    tenant_id bigint,
    user_id integer NOT NULL
);


ALTER TABLE public.dcim_rackreservation OWNER TO netbox;

--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackreservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackreservation_id_seq OWNER TO netbox;

--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackreservation_id_seq OWNED BY public.dcim_rackreservation.id;


--
-- Name: dcim_rackrole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackrole (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_rackrole OWNER TO netbox;

--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackrole_id_seq OWNER TO netbox;

--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackrole_id_seq OWNED BY public.dcim_rackrole.id;


--
-- Name: dcim_rearport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rearport (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    _cable_peer_type_id integer,
    cable_id bigint,
    device_id bigint NOT NULL,
    color character varying(6) NOT NULL,
    CONSTRAINT dcim_rearport__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_rearport_positions_check CHECK ((positions >= 0))
);


ALTER TABLE public.dcim_rearport OWNER TO netbox;

--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rearport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rearport_id_seq OWNER TO netbox;

--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rearport_id_seq OWNED BY public.dcim_rearport.id;


--
-- Name: dcim_rearporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rearporttemplate (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    device_type_id bigint NOT NULL,
    color character varying(6) NOT NULL,
    CONSTRAINT dcim_rearporttemplate_positions_check CHECK ((positions >= 0))
);


ALTER TABLE public.dcim_rearporttemplate OWNER TO netbox;

--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rearporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rearporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rearporttemplate_id_seq OWNED BY public.dcim_rearporttemplate.id;


--
-- Name: dcim_region; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_region (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT dcim_region_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_region_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_region_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_region_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_region OWNER TO netbox;

--
-- Name: dcim_region_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_region_id_seq OWNER TO netbox;

--
-- Name: dcim_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_region_id_seq OWNED BY public.dcim_region.id;


--
-- Name: dcim_site; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_site (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    _name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    status character varying(50) NOT NULL,
    facility character varying(50) NOT NULL,
    asn bigint,
    time_zone character varying(63) NOT NULL,
    description character varying(200) NOT NULL,
    physical_address character varying(200) NOT NULL,
    shipping_address character varying(200) NOT NULL,
    latitude numeric(8,6),
    longitude numeric(9,6),
    contact_name character varying(50) NOT NULL,
    contact_phone character varying(20) NOT NULL,
    contact_email character varying(254) NOT NULL,
    comments text NOT NULL,
    group_id bigint,
    region_id bigint,
    tenant_id bigint
);


ALTER TABLE public.dcim_site OWNER TO netbox;

--
-- Name: dcim_site_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_site_id_seq OWNER TO netbox;

--
-- Name: dcim_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_site_id_seq OWNED BY public.dcim_site.id;


--
-- Name: dcim_sitegroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_sitegroup (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT dcim_sitegroup_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_sitegroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_sitegroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_sitegroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_sitegroup OWNER TO netbox;

--
-- Name: dcim_sitegroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_sitegroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_sitegroup_id_seq OWNER TO netbox;

--
-- Name: dcim_sitegroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_sitegroup_id_seq OWNED BY public.dcim_sitegroup.id;


--
-- Name: dcim_virtualchassis; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_virtualchassis (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    domain character varying(30) NOT NULL,
    master_id bigint
);


ALTER TABLE public.dcim_virtualchassis OWNER TO netbox;

--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_virtualchassis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_virtualchassis_id_seq OWNER TO netbox;

--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_virtualchassis_id_seq OWNED BY public.dcim_virtualchassis.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO netbox;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO netbox;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO netbox;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO netbox;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO netbox;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO netbox;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO netbox;

--
-- Name: extras_configcontext; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    weight smallint NOT NULL,
    description character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    data jsonb NOT NULL,
    CONSTRAINT extras_configcontext_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_configcontext OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_cluster_groups (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    clustergroup_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_cluster_groups OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_cluster_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_cluster_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_cluster_groups_id_seq OWNED BY public.extras_configcontext_cluster_groups.id;


--
-- Name: extras_configcontext_clusters; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_clusters (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    cluster_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_clusters OWNER TO netbox;

--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_clusters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_clusters_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_clusters_id_seq OWNED BY public.extras_configcontext_clusters.id;


--
-- Name: extras_configcontext_device_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_device_types (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    devicetype_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_device_types OWNER TO netbox;

--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_device_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_device_types_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_device_types_id_seq OWNED BY public.extras_configcontext_device_types.id;


--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_id_seq OWNED BY public.extras_configcontext.id;


--
-- Name: extras_configcontext_platforms; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_platforms (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    platform_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_platforms OWNER TO netbox;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_platforms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_platforms_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_platforms_id_seq OWNED BY public.extras_configcontext_platforms.id;


--
-- Name: extras_configcontext_regions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_regions (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    region_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_regions OWNER TO netbox;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_regions_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_regions_id_seq OWNED BY public.extras_configcontext_regions.id;


--
-- Name: extras_configcontext_roles; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_roles (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    devicerole_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_roles OWNER TO netbox;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_roles_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_roles_id_seq OWNED BY public.extras_configcontext_roles.id;


--
-- Name: extras_configcontext_site_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_site_groups (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    sitegroup_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_site_groups OWNER TO netbox;

--
-- Name: extras_configcontext_site_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_site_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_site_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_site_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_site_groups_id_seq OWNED BY public.extras_configcontext_site_groups.id;


--
-- Name: extras_configcontext_sites; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_sites (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    site_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_sites OWNER TO netbox;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_sites_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_sites_id_seq OWNED BY public.extras_configcontext_sites.id;


--
-- Name: extras_configcontext_tags; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tags (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_tags OWNER TO netbox;

--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tags_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tags_id_seq OWNED BY public.extras_configcontext_tags.id;


--
-- Name: extras_configcontext_tenant_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tenant_groups (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    tenantgroup_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_tenant_groups OWNER TO netbox;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tenant_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenant_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tenant_groups_id_seq OWNED BY public.extras_configcontext_tenant_groups.id;


--
-- Name: extras_configcontext_tenants; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tenants (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    tenant_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_tenants OWNER TO netbox;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tenants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenants_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tenants_id_seq OWNED BY public.extras_configcontext_tenants.id;


--
-- Name: extras_customfield; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfield (
    id bigint NOT NULL,
    type character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    label character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    required boolean NOT NULL,
    filter_logic character varying(50) NOT NULL,
    "default" jsonb,
    weight smallint NOT NULL,
    validation_minimum integer,
    validation_maximum integer,
    validation_regex character varying(500) NOT NULL,
    choices character varying(100)[],
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT extras_customfield_validation_maximum_check CHECK ((validation_maximum >= 0)),
    CONSTRAINT extras_customfield_validation_minimum_check CHECK ((validation_minimum >= 0)),
    CONSTRAINT extras_customfield_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customfield OWNER TO netbox;

--
-- Name: extras_customfield_content_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfield_content_types (
    id integer NOT NULL,
    customfield_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_customfield_content_types OWNER TO netbox;

--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfield_content_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_content_types_id_seq OWNER TO netbox;

--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfield_content_types_id_seq OWNED BY public.extras_customfield_content_types.id;


--
-- Name: extras_customfield_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_id_seq OWNER TO netbox;

--
-- Name: extras_customfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfield_id_seq OWNED BY public.extras_customfield.id;


--
-- Name: extras_customlink; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customlink (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    link_text character varying(500) NOT NULL,
    link_url character varying(500) NOT NULL,
    weight smallint NOT NULL,
    group_name character varying(50) NOT NULL,
    button_class character varying(30) NOT NULL,
    new_window boolean NOT NULL,
    content_type_id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT extras_customlink_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customlink OWNER TO netbox;

--
-- Name: extras_customlink_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customlink_id_seq OWNER TO netbox;

--
-- Name: extras_customlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customlink_id_seq OWNED BY public.extras_customlink.id;


--
-- Name: extras_exporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_exporttemplate (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    template_code text NOT NULL,
    mime_type character varying(50) NOT NULL,
    file_extension character varying(15) NOT NULL,
    as_attachment boolean NOT NULL,
    content_type_id integer NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.extras_exporttemplate OWNER TO netbox;

--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_exporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_exporttemplate_id_seq OWNER TO netbox;

--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_exporttemplate_id_seq OWNED BY public.extras_exporttemplate.id;


--
-- Name: extras_imageattachment; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_imageattachment (
    id bigint NOT NULL,
    object_id integer NOT NULL,
    image character varying(100) NOT NULL,
    image_height smallint NOT NULL,
    image_width smallint NOT NULL,
    name character varying(50) NOT NULL,
    created timestamp with time zone NOT NULL,
    content_type_id integer NOT NULL,
    CONSTRAINT extras_imageattachment_image_height_check CHECK ((image_height >= 0)),
    CONSTRAINT extras_imageattachment_image_width_check CHECK ((image_width >= 0)),
    CONSTRAINT extras_imageattachment_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.extras_imageattachment OWNER TO netbox;

--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_imageattachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_imageattachment_id_seq OWNER TO netbox;

--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_imageattachment_id_seq OWNED BY public.extras_imageattachment.id;


--
-- Name: extras_jobresult; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_jobresult (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    completed timestamp with time zone,
    status character varying(30) NOT NULL,
    data jsonb,
    job_id uuid NOT NULL,
    obj_type_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.extras_jobresult OWNER TO netbox;

--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_jobresult_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_jobresult_id_seq OWNER TO netbox;

--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_jobresult_id_seq OWNED BY public.extras_jobresult.id;


--
-- Name: extras_journalentry; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_journalentry (
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    assigned_object_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    kind character varying(30) NOT NULL,
    comments text NOT NULL,
    assigned_object_type_id integer NOT NULL,
    created_by_id integer,
    CONSTRAINT extras_journalentry_assigned_object_id_check CHECK ((assigned_object_id >= 0))
);


ALTER TABLE public.extras_journalentry OWNER TO netbox;

--
-- Name: extras_journalentry_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_journalentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_journalentry_id_seq OWNER TO netbox;

--
-- Name: extras_journalentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_journalentry_id_seq OWNED BY public.extras_journalentry.id;


--
-- Name: extras_objectchange; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_objectchange (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    user_name character varying(150) NOT NULL,
    request_id uuid NOT NULL,
    action character varying(50) NOT NULL,
    changed_object_id integer NOT NULL,
    related_object_id integer,
    object_repr character varying(200) NOT NULL,
    prechange_data jsonb,
    postchange_data jsonb,
    changed_object_type_id integer NOT NULL,
    related_object_type_id integer,
    user_id integer,
    CONSTRAINT extras_objectchange_changed_object_id_check CHECK ((changed_object_id >= 0)),
    CONSTRAINT extras_objectchange_related_object_id_check CHECK ((related_object_id >= 0))
);


ALTER TABLE public.extras_objectchange OWNER TO netbox;

--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_objectchange_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_objectchange_id_seq OWNER TO netbox;

--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_objectchange_id_seq OWNED BY public.extras_objectchange.id;


--
-- Name: extras_tag; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_tag (
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.extras_tag OWNER TO netbox;

--
-- Name: extras_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_tag_id_seq OWNER TO netbox;

--
-- Name: extras_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_tag_id_seq OWNED BY public.extras_tag.id;


--
-- Name: extras_taggeditem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_taggeditem (
    object_id integer NOT NULL,
    id bigint NOT NULL,
    content_type_id integer NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.extras_taggeditem OWNER TO netbox;

--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_taggeditem_id_seq OWNER TO netbox;

--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_taggeditem_id_seq OWNED BY public.extras_taggeditem.id;


--
-- Name: extras_webhook; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_webhook (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    type_create boolean NOT NULL,
    type_update boolean NOT NULL,
    type_delete boolean NOT NULL,
    payload_url character varying(500) NOT NULL,
    enabled boolean NOT NULL,
    http_method character varying(30) NOT NULL,
    http_content_type character varying(100) NOT NULL,
    additional_headers text NOT NULL,
    body_template text NOT NULL,
    secret character varying(255) NOT NULL,
    ssl_verification boolean NOT NULL,
    ca_file_path character varying(4096),
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.extras_webhook OWNER TO netbox;

--
-- Name: extras_webhook_content_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_webhook_content_types (
    id integer NOT NULL,
    webhook_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_webhook_content_types OWNER TO netbox;

--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_webhook_content_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_webhook_content_types_id_seq OWNER TO netbox;

--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_webhook_content_types_id_seq OWNED BY public.extras_webhook_content_types.id;


--
-- Name: extras_webhook_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_webhook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_webhook_id_seq OWNER TO netbox;

--
-- Name: extras_webhook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_webhook_id_seq OWNED BY public.extras_webhook.id;


--
-- Name: ipam_aggregate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_aggregate (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    prefix cidr NOT NULL,
    date_added date,
    description character varying(200) NOT NULL,
    rir_id bigint NOT NULL,
    tenant_id bigint
);


ALTER TABLE public.ipam_aggregate OWNER TO netbox;

--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_aggregate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_aggregate_id_seq OWNER TO netbox;

--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_aggregate_id_seq OWNED BY public.ipam_aggregate.id;


--
-- Name: ipam_ipaddress; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_ipaddress (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    address inet NOT NULL,
    status character varying(50) NOT NULL,
    role character varying(50) NOT NULL,
    assigned_object_id integer,
    dns_name character varying(255) NOT NULL,
    description character varying(200) NOT NULL,
    assigned_object_type_id integer,
    nat_inside_id bigint,
    tenant_id bigint,
    vrf_id bigint,
    CONSTRAINT ipam_ipaddress_assigned_object_id_check CHECK ((assigned_object_id >= 0))
);


ALTER TABLE public.ipam_ipaddress OWNER TO netbox;

--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_ipaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_ipaddress_id_seq OWNER TO netbox;

--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_ipaddress_id_seq OWNED BY public.ipam_ipaddress.id;


--
-- Name: ipam_iprange; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_iprange (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    start_address inet NOT NULL,
    end_address inet NOT NULL,
    size integer NOT NULL,
    status character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    role_id bigint,
    tenant_id bigint,
    vrf_id bigint,
    CONSTRAINT ipam_iprange_size_check CHECK ((size >= 0))
);


ALTER TABLE public.ipam_iprange OWNER TO netbox;

--
-- Name: ipam_iprange_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_iprange_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_iprange_id_seq OWNER TO netbox;

--
-- Name: ipam_iprange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_iprange_id_seq OWNED BY public.ipam_iprange.id;


--
-- Name: ipam_prefix; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_prefix (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    prefix cidr NOT NULL,
    status character varying(50) NOT NULL,
    is_pool boolean NOT NULL,
    description character varying(200) NOT NULL,
    role_id bigint,
    site_id bigint,
    tenant_id bigint,
    vlan_id bigint,
    vrf_id bigint,
    _children bigint NOT NULL,
    _depth smallint NOT NULL,
    mark_utilized boolean NOT NULL,
    CONSTRAINT ipam_prefix__children_check CHECK ((_children >= 0)),
    CONSTRAINT ipam_prefix__depth_check CHECK ((_depth >= 0))
);


ALTER TABLE public.ipam_prefix OWNER TO netbox;

--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_prefix_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_prefix_id_seq OWNER TO netbox;

--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_prefix_id_seq OWNED BY public.ipam_prefix.id;


--
-- Name: ipam_rir; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_rir (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    is_private boolean NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.ipam_rir OWNER TO netbox;

--
-- Name: ipam_rir_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_rir_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_rir_id_seq OWNER TO netbox;

--
-- Name: ipam_rir_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_rir_id_seq OWNED BY public.ipam_rir.id;


--
-- Name: ipam_role; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_role (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    weight smallint NOT NULL,
    description character varying(200) NOT NULL,
    CONSTRAINT ipam_role_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.ipam_role OWNER TO netbox;

--
-- Name: ipam_role_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_role_id_seq OWNER TO netbox;

--
-- Name: ipam_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_role_id_seq OWNED BY public.ipam_role.id;


--
-- Name: ipam_routetarget; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_routetarget (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(21) NOT NULL,
    description character varying(200) NOT NULL,
    tenant_id bigint
);


ALTER TABLE public.ipam_routetarget OWNER TO netbox;

--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_routetarget_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_routetarget_id_seq OWNER TO netbox;

--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_routetarget_id_seq OWNED BY public.ipam_routetarget.id;


--
-- Name: ipam_service; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_service (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    protocol character varying(50) NOT NULL,
    ports integer[] NOT NULL,
    description character varying(200) NOT NULL,
    device_id bigint,
    virtual_machine_id bigint
);


ALTER TABLE public.ipam_service OWNER TO netbox;

--
-- Name: ipam_service_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_id_seq OWNER TO netbox;

--
-- Name: ipam_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_service_id_seq OWNED BY public.ipam_service.id;


--
-- Name: ipam_service_ipaddresses; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_service_ipaddresses (
    id integer NOT NULL,
    service_id bigint NOT NULL,
    ipaddress_id bigint NOT NULL
);


ALTER TABLE public.ipam_service_ipaddresses OWNER TO netbox;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_service_ipaddresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_ipaddresses_id_seq OWNER TO netbox;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_service_ipaddresses_id_seq OWNED BY public.ipam_service_ipaddresses.id;


--
-- Name: ipam_vlan; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vlan (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    vid smallint NOT NULL,
    name character varying(64) NOT NULL,
    status character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    group_id bigint,
    role_id bigint,
    site_id bigint,
    tenant_id bigint,
    CONSTRAINT ipam_vlan_vid_check CHECK ((vid >= 0))
);


ALTER TABLE public.ipam_vlan OWNER TO netbox;

--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vlan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vlan_id_seq OWNER TO netbox;

--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vlan_id_seq OWNED BY public.ipam_vlan.id;


--
-- Name: ipam_vlangroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vlangroup (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    scope_id bigint,
    description character varying(200) NOT NULL,
    scope_type_id integer,
    CONSTRAINT ipam_vlangroup_scope_id_check CHECK ((scope_id >= 0))
);


ALTER TABLE public.ipam_vlangroup OWNER TO netbox;

--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vlangroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vlangroup_id_seq OWNER TO netbox;

--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vlangroup_id_seq OWNED BY public.ipam_vlangroup.id;


--
-- Name: ipam_vrf; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rd character varying(21),
    enforce_unique boolean NOT NULL,
    description character varying(200) NOT NULL,
    tenant_id bigint
);


ALTER TABLE public.ipam_vrf OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf_export_targets (
    id integer NOT NULL,
    vrf_id bigint NOT NULL,
    routetarget_id bigint NOT NULL
);


ALTER TABLE public.ipam_vrf_export_targets OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_export_targets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_export_targets_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_export_targets_id_seq OWNED BY public.ipam_vrf_export_targets.id;


--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_id_seq OWNED BY public.ipam_vrf.id;


--
-- Name: ipam_vrf_import_targets; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf_import_targets (
    id integer NOT NULL,
    vrf_id bigint NOT NULL,
    routetarget_id bigint NOT NULL
);


ALTER TABLE public.ipam_vrf_import_targets OWNER TO netbox;

--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_import_targets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_import_targets_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_import_targets_id_seq OWNED BY public.ipam_vrf_import_targets.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO netbox;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO netbox;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO netbox;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO netbox;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: tenancy_tenant; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_tenant (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    group_id bigint
);


ALTER TABLE public.tenancy_tenant OWNER TO netbox;

--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_tenant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_tenant_id_seq OWNER TO netbox;

--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_tenant_id_seq OWNED BY public.tenancy_tenant.id;


--
-- Name: tenancy_tenantgroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_tenantgroup (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT tenancy_tenantgroup_level_check CHECK ((level >= 0)),
    CONSTRAINT tenancy_tenantgroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT tenancy_tenantgroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT tenancy_tenantgroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.tenancy_tenantgroup OWNER TO netbox;

--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_tenantgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_tenantgroup_id_seq OWNER TO netbox;

--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_tenantgroup_id_seq OWNED BY public.tenancy_tenantgroup.id;


--
-- Name: users_objectpermission; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    enabled boolean NOT NULL,
    actions character varying(30)[] NOT NULL,
    constraints jsonb
);


ALTER TABLE public.users_objectpermission OWNER TO netbox;

--
-- Name: users_objectpermission_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_groups (
    id integer NOT NULL,
    objectpermission_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_groups OWNER TO netbox;

--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_groups_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_groups_id_seq OWNED BY public.users_objectpermission_groups.id;


--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_id_seq OWNED BY public.users_objectpermission.id;


--
-- Name: users_objectpermission_object_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_object_types (
    id integer NOT NULL,
    objectpermission_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_object_types OWNER TO netbox;

--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_object_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_object_types_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_object_types_id_seq OWNED BY public.users_objectpermission_object_types.id;


--
-- Name: users_objectpermission_users; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_users (
    id integer NOT NULL,
    objectpermission_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_users OWNER TO netbox;

--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_users_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_users_id_seq OWNED BY public.users_objectpermission_users.id;


--
-- Name: users_token; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_token (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    expires timestamp with time zone,
    key character varying(40) NOT NULL,
    write_enabled boolean NOT NULL,
    description character varying(200) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_token OWNER TO netbox;

--
-- Name: users_token_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_token_id_seq OWNER TO netbox;

--
-- Name: users_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_token_id_seq OWNED BY public.users_token.id;


--
-- Name: users_userconfig; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_userconfig (
    id integer NOT NULL,
    data jsonb NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_userconfig OWNER TO netbox;

--
-- Name: users_userconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_userconfig_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userconfig_id_seq OWNER TO netbox;

--
-- Name: users_userconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_userconfig_id_seq OWNED BY public.users_userconfig.id;


--
-- Name: virtualization_cluster; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_cluster (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    comments text NOT NULL,
    group_id bigint,
    site_id bigint,
    tenant_id bigint,
    type_id bigint NOT NULL
);


ALTER TABLE public.virtualization_cluster OWNER TO netbox;

--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_cluster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_cluster_id_seq OWNER TO netbox;

--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_cluster_id_seq OWNED BY public.virtualization_cluster.id;


--
-- Name: virtualization_clustergroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_clustergroup (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.virtualization_clustergroup OWNER TO netbox;

--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_clustergroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_clustergroup_id_seq OWNER TO netbox;

--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_clustergroup_id_seq OWNED BY public.virtualization_clustergroup.id;


--
-- Name: virtualization_clustertype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_clustertype (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.virtualization_clustertype OWNER TO netbox;

--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_clustertype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_clustertype_id_seq OWNER TO netbox;

--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_clustertype_id_seq OWNED BY public.virtualization_clustertype.id;


--
-- Name: virtualization_virtualmachine; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_virtualmachine (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    local_context_data jsonb,
    name character varying(64) NOT NULL,
    status character varying(50) NOT NULL,
    vcpus numeric(6,2),
    memory integer,
    disk integer,
    comments text NOT NULL,
    cluster_id bigint NOT NULL,
    platform_id bigint,
    primary_ip4_id bigint,
    primary_ip6_id bigint,
    role_id bigint,
    tenant_id bigint,
    _name character varying(100) NOT NULL,
    CONSTRAINT virtualization_virtualmachine_disk_check CHECK ((disk >= 0)),
    CONSTRAINT virtualization_virtualmachine_memory_check CHECK ((memory >= 0))
);


ALTER TABLE public.virtualization_virtualmachine OWNER TO netbox;

--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_virtualmachine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_virtualmachine_id_seq OWNER TO netbox;

--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_virtualmachine_id_seq OWNED BY public.virtualization_virtualmachine.id;


--
-- Name: virtualization_vminterface; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_vminterface (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    enabled boolean NOT NULL,
    mac_address macaddr,
    mtu integer,
    mode character varying(50) NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    parent_id bigint,
    untagged_vlan_id bigint,
    virtual_machine_id bigint NOT NULL,
    CONSTRAINT virtualization_vminterface_mtu_check CHECK ((mtu >= 0))
);


ALTER TABLE public.virtualization_vminterface OWNER TO netbox;

--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_vminterface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_vminterface_id_seq OWNER TO netbox;

--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_vminterface_id_seq OWNED BY public.virtualization_vminterface.id;


--
-- Name: virtualization_vminterface_tagged_vlans; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_vminterface_tagged_vlans (
    id integer NOT NULL,
    vminterface_id bigint NOT NULL,
    vlan_id bigint NOT NULL
);


ALTER TABLE public.virtualization_vminterface_tagged_vlans OWNER TO netbox;

--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_vminterface_tagged_vlans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_vminterface_tagged_vlans_id_seq OWNER TO netbox;

--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_vminterface_tagged_vlans_id_seq OWNED BY public.virtualization_vminterface_tagged_vlans.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: circuits_circuit id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuit_id_seq'::regclass);


--
-- Name: circuits_circuittermination id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuittermination_id_seq'::regclass);


--
-- Name: circuits_circuittype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuittype_id_seq'::regclass);


--
-- Name: circuits_provider id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider ALTER COLUMN id SET DEFAULT nextval('public.circuits_provider_id_seq'::regclass);


--
-- Name: circuits_providernetwork id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork ALTER COLUMN id SET DEFAULT nextval('public.circuits_providernetwork_id_seq'::regclass);


--
-- Name: dcim_cable id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable ALTER COLUMN id SET DEFAULT nextval('public.dcim_cable_id_seq'::regclass);


--
-- Name: dcim_cablepath id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath ALTER COLUMN id SET DEFAULT nextval('public.dcim_cablepath_id_seq'::regclass);


--
-- Name: dcim_consoleport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleport_id_seq'::regclass);


--
-- Name: dcim_consoleporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleporttemplate_id_seq'::regclass);


--
-- Name: dcim_consoleserverport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleserverport_id_seq'::regclass);


--
-- Name: dcim_consoleserverporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleserverporttemplate_id_seq'::regclass);


--
-- Name: dcim_device id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device ALTER COLUMN id SET DEFAULT nextval('public.dcim_device_id_seq'::regclass);


--
-- Name: dcim_devicebay id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicebay_id_seq'::regclass);


--
-- Name: dcim_devicebaytemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicebaytemplate_id_seq'::regclass);


--
-- Name: dcim_devicerole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicerole_id_seq'::regclass);


--
-- Name: dcim_devicetype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicetype_id_seq'::regclass);


--
-- Name: dcim_frontport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport ALTER COLUMN id SET DEFAULT nextval('public.dcim_frontport_id_seq'::regclass);


--
-- Name: dcim_frontporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_frontporttemplate_id_seq'::regclass);


--
-- Name: dcim_interface id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_id_seq'::regclass);


--
-- Name: dcim_interface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_tagged_vlans_id_seq'::regclass);


--
-- Name: dcim_interfacetemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_interfacetemplate_id_seq'::regclass);


--
-- Name: dcim_inventoryitem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem ALTER COLUMN id SET DEFAULT nextval('public.dcim_inventoryitem_id_seq'::regclass);


--
-- Name: dcim_location id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location ALTER COLUMN id SET DEFAULT nextval('public.dcim_location_id_seq'::regclass);


--
-- Name: dcim_manufacturer id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer ALTER COLUMN id SET DEFAULT nextval('public.dcim_manufacturer_id_seq'::regclass);


--
-- Name: dcim_platform id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform ALTER COLUMN id SET DEFAULT nextval('public.dcim_platform_id_seq'::regclass);


--
-- Name: dcim_powerfeed id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerfeed_id_seq'::regclass);


--
-- Name: dcim_poweroutlet id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet ALTER COLUMN id SET DEFAULT nextval('public.dcim_poweroutlet_id_seq'::regclass);


--
-- Name: dcim_poweroutlettemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_poweroutlettemplate_id_seq'::regclass);


--
-- Name: dcim_powerpanel id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerpanel_id_seq'::regclass);


--
-- Name: dcim_powerport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerport_id_seq'::regclass);


--
-- Name: dcim_powerporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerporttemplate_id_seq'::regclass);


--
-- Name: dcim_rack id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack ALTER COLUMN id SET DEFAULT nextval('public.dcim_rack_id_seq'::regclass);


--
-- Name: dcim_rackreservation id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackreservation_id_seq'::regclass);


--
-- Name: dcim_rackrole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackrole_id_seq'::regclass);


--
-- Name: dcim_rearport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport ALTER COLUMN id SET DEFAULT nextval('public.dcim_rearport_id_seq'::regclass);


--
-- Name: dcim_rearporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_rearporttemplate_id_seq'::regclass);


--
-- Name: dcim_region id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region ALTER COLUMN id SET DEFAULT nextval('public.dcim_region_id_seq'::regclass);


--
-- Name: dcim_site id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site ALTER COLUMN id SET DEFAULT nextval('public.dcim_site_id_seq'::regclass);


--
-- Name: dcim_sitegroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup ALTER COLUMN id SET DEFAULT nextval('public.dcim_sitegroup_id_seq'::regclass);


--
-- Name: dcim_virtualchassis id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis ALTER COLUMN id SET DEFAULT nextval('public.dcim_virtualchassis_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: extras_configcontext id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_id_seq'::regclass);


--
-- Name: extras_configcontext_cluster_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_cluster_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_clusters id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_clusters_id_seq'::regclass);


--
-- Name: extras_configcontext_device_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_device_types_id_seq'::regclass);


--
-- Name: extras_configcontext_platforms id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_platforms_id_seq'::regclass);


--
-- Name: extras_configcontext_regions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_regions_id_seq'::regclass);


--
-- Name: extras_configcontext_roles id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_roles_id_seq'::regclass);


--
-- Name: extras_configcontext_site_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_site_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_sites id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_sites_id_seq'::regclass);


--
-- Name: extras_configcontext_tags id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tags_id_seq'::regclass);


--
-- Name: extras_configcontext_tenant_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenant_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_tenants id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenants_id_seq'::regclass);


--
-- Name: extras_customfield id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_id_seq'::regclass);


--
-- Name: extras_customfield_content_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_content_types_id_seq'::regclass);


--
-- Name: extras_customlink id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink ALTER COLUMN id SET DEFAULT nextval('public.extras_customlink_id_seq'::regclass);


--
-- Name: extras_exporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate ALTER COLUMN id SET DEFAULT nextval('public.extras_exporttemplate_id_seq'::regclass);


--
-- Name: extras_imageattachment id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment ALTER COLUMN id SET DEFAULT nextval('public.extras_imageattachment_id_seq'::regclass);


--
-- Name: extras_jobresult id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult ALTER COLUMN id SET DEFAULT nextval('public.extras_jobresult_id_seq'::regclass);


--
-- Name: extras_journalentry id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry ALTER COLUMN id SET DEFAULT nextval('public.extras_journalentry_id_seq'::regclass);


--
-- Name: extras_objectchange id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange ALTER COLUMN id SET DEFAULT nextval('public.extras_objectchange_id_seq'::regclass);


--
-- Name: extras_tag id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag ALTER COLUMN id SET DEFAULT nextval('public.extras_tag_id_seq'::regclass);


--
-- Name: extras_taggeditem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.extras_taggeditem_id_seq'::regclass);


--
-- Name: extras_webhook id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook ALTER COLUMN id SET DEFAULT nextval('public.extras_webhook_id_seq'::regclass);


--
-- Name: extras_webhook_content_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_webhook_content_types_id_seq'::regclass);


--
-- Name: ipam_aggregate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate ALTER COLUMN id SET DEFAULT nextval('public.ipam_aggregate_id_seq'::regclass);


--
-- Name: ipam_ipaddress id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress ALTER COLUMN id SET DEFAULT nextval('public.ipam_ipaddress_id_seq'::regclass);


--
-- Name: ipam_iprange id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange ALTER COLUMN id SET DEFAULT nextval('public.ipam_iprange_id_seq'::regclass);


--
-- Name: ipam_prefix id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix ALTER COLUMN id SET DEFAULT nextval('public.ipam_prefix_id_seq'::regclass);


--
-- Name: ipam_rir id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir ALTER COLUMN id SET DEFAULT nextval('public.ipam_rir_id_seq'::regclass);


--
-- Name: ipam_role id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role ALTER COLUMN id SET DEFAULT nextval('public.ipam_role_id_seq'::regclass);


--
-- Name: ipam_routetarget id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget ALTER COLUMN id SET DEFAULT nextval('public.ipam_routetarget_id_seq'::regclass);


--
-- Name: ipam_service id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_id_seq'::regclass);


--
-- Name: ipam_service_ipaddresses id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_ipaddresses_id_seq'::regclass);


--
-- Name: ipam_vlan id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan ALTER COLUMN id SET DEFAULT nextval('public.ipam_vlan_id_seq'::regclass);


--
-- Name: ipam_vlangroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup ALTER COLUMN id SET DEFAULT nextval('public.ipam_vlangroup_id_seq'::regclass);


--
-- Name: ipam_vrf id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_id_seq'::regclass);


--
-- Name: ipam_vrf_export_targets id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_export_targets_id_seq'::regclass);


--
-- Name: ipam_vrf_import_targets id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_import_targets_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Name: tenancy_tenant id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant ALTER COLUMN id SET DEFAULT nextval('public.tenancy_tenant_id_seq'::regclass);


--
-- Name: tenancy_tenantgroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup ALTER COLUMN id SET DEFAULT nextval('public.tenancy_tenantgroup_id_seq'::regclass);


--
-- Name: users_objectpermission id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_id_seq'::regclass);


--
-- Name: users_objectpermission_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_groups_id_seq'::regclass);


--
-- Name: users_objectpermission_object_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_object_types_id_seq'::regclass);


--
-- Name: users_objectpermission_users id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_users_id_seq'::regclass);


--
-- Name: users_token id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token ALTER COLUMN id SET DEFAULT nextval('public.users_token_id_seq'::regclass);


--
-- Name: users_userconfig id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig ALTER COLUMN id SET DEFAULT nextval('public.users_userconfig_id_seq'::regclass);


--
-- Name: virtualization_cluster id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster ALTER COLUMN id SET DEFAULT nextval('public.virtualization_cluster_id_seq'::regclass);


--
-- Name: virtualization_clustergroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup ALTER COLUMN id SET DEFAULT nextval('public.virtualization_clustergroup_id_seq'::regclass);


--
-- Name: virtualization_clustertype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype ALTER COLUMN id SET DEFAULT nextval('public.virtualization_clustertype_id_seq'::regclass);


--
-- Name: virtualization_virtualmachine id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine ALTER COLUMN id SET DEFAULT nextval('public.virtualization_virtualmachine_id_seq'::regclass);


--
-- Name: virtualization_vminterface id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface ALTER COLUMN id SET DEFAULT nextval('public.virtualization_vminterface_id_seq'::regclass);


--
-- Name: virtualization_vminterface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.virtualization_vminterface_tagged_vlans_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add tag	7	add_tag
26	Can change tag	7	change_tag
27	Can delete tag	7	delete_tag
28	Can view tag	7	view_tag
29	Can add tagged item	8	add_taggeditem
30	Can change tagged item	8	change_taggeditem
31	Can delete tagged item	8	delete_taggeditem
32	Can view tagged item	8	view_taggeditem
33	Can add circuit	9	add_circuit
34	Can change circuit	9	change_circuit
35	Can delete circuit	9	delete_circuit
36	Can view circuit	9	view_circuit
37	Can add circuit termination	10	add_circuittermination
38	Can change circuit termination	10	change_circuittermination
39	Can delete circuit termination	10	delete_circuittermination
40	Can view circuit termination	10	view_circuittermination
41	Can add circuit type	11	add_circuittype
42	Can change circuit type	11	change_circuittype
43	Can delete circuit type	11	delete_circuittype
44	Can view circuit type	11	view_circuittype
45	Can add provider	12	add_provider
46	Can change provider	12	change_provider
47	Can delete provider	12	delete_provider
48	Can view provider	12	view_provider
49	Can add provider network	13	add_providernetwork
50	Can change provider network	13	change_providernetwork
51	Can delete provider network	13	delete_providernetwork
52	Can view provider network	13	view_providernetwork
53	Can add cable	14	add_cable
54	Can change cable	14	change_cable
55	Can delete cable	14	delete_cable
56	Can view cable	14	view_cable
57	Can add cable path	15	add_cablepath
58	Can change cable path	15	change_cablepath
59	Can delete cable path	15	delete_cablepath
60	Can view cable path	15	view_cablepath
61	Can add console port	16	add_consoleport
62	Can change console port	16	change_consoleport
63	Can delete console port	16	delete_consoleport
64	Can view console port	16	view_consoleport
65	Can add console port template	17	add_consoleporttemplate
66	Can change console port template	17	change_consoleporttemplate
67	Can delete console port template	17	delete_consoleporttemplate
68	Can view console port template	17	view_consoleporttemplate
69	Can add console server port	18	add_consoleserverport
70	Can change console server port	18	change_consoleserverport
71	Can delete console server port	18	delete_consoleserverport
72	Can view console server port	18	view_consoleserverport
73	Can add console server port template	19	add_consoleserverporttemplate
74	Can change console server port template	19	change_consoleserverporttemplate
75	Can delete console server port template	19	delete_consoleserverporttemplate
76	Can view console server port template	19	view_consoleserverporttemplate
77	Can add device	20	add_device
78	Can change device	20	change_device
79	Can delete device	20	delete_device
80	Can view device	20	view_device
81	Can add device bay	21	add_devicebay
82	Can change device bay	21	change_devicebay
83	Can delete device bay	21	delete_devicebay
84	Can view device bay	21	view_devicebay
85	Can add device bay template	22	add_devicebaytemplate
86	Can change device bay template	22	change_devicebaytemplate
87	Can delete device bay template	22	delete_devicebaytemplate
88	Can view device bay template	22	view_devicebaytemplate
89	Can add device role	23	add_devicerole
90	Can change device role	23	change_devicerole
91	Can delete device role	23	delete_devicerole
92	Can view device role	23	view_devicerole
93	Can add device type	24	add_devicetype
94	Can change device type	24	change_devicetype
95	Can delete device type	24	delete_devicetype
96	Can view device type	24	view_devicetype
97	Can add front port	25	add_frontport
98	Can change front port	25	change_frontport
99	Can delete front port	25	delete_frontport
305	Can add token	77	add_token
100	Can view front port	25	view_frontport
101	Can add front port template	26	add_frontporttemplate
102	Can change front port template	26	change_frontporttemplate
103	Can delete front port template	26	delete_frontporttemplate
104	Can view front port template	26	view_frontporttemplate
105	Can add interface	27	add_interface
106	Can change interface	27	change_interface
107	Can delete interface	27	delete_interface
108	Can view interface	27	view_interface
109	Can add interface template	28	add_interfacetemplate
110	Can change interface template	28	change_interfacetemplate
111	Can delete interface template	28	delete_interfacetemplate
112	Can view interface template	28	view_interfacetemplate
113	Can add inventory item	29	add_inventoryitem
114	Can change inventory item	29	change_inventoryitem
115	Can delete inventory item	29	delete_inventoryitem
116	Can view inventory item	29	view_inventoryitem
117	Can add location	30	add_location
118	Can change location	30	change_location
119	Can delete location	30	delete_location
120	Can view location	30	view_location
121	Can add manufacturer	31	add_manufacturer
122	Can change manufacturer	31	change_manufacturer
123	Can delete manufacturer	31	delete_manufacturer
124	Can view manufacturer	31	view_manufacturer
125	Can add platform	32	add_platform
126	Can change platform	32	change_platform
127	Can delete platform	32	delete_platform
128	Can view platform	32	view_platform
129	Can add power feed	33	add_powerfeed
130	Can change power feed	33	change_powerfeed
131	Can delete power feed	33	delete_powerfeed
132	Can view power feed	33	view_powerfeed
133	Can add power outlet	34	add_poweroutlet
134	Can change power outlet	34	change_poweroutlet
135	Can delete power outlet	34	delete_poweroutlet
136	Can view power outlet	34	view_poweroutlet
137	Can add power outlet template	35	add_poweroutlettemplate
138	Can change power outlet template	35	change_poweroutlettemplate
139	Can delete power outlet template	35	delete_poweroutlettemplate
140	Can view power outlet template	35	view_poweroutlettemplate
141	Can add power panel	36	add_powerpanel
142	Can change power panel	36	change_powerpanel
143	Can delete power panel	36	delete_powerpanel
144	Can view power panel	36	view_powerpanel
145	Can add power port	37	add_powerport
146	Can change power port	37	change_powerport
147	Can delete power port	37	delete_powerport
148	Can view power port	37	view_powerport
149	Can add power port template	38	add_powerporttemplate
150	Can change power port template	38	change_powerporttemplate
151	Can delete power port template	38	delete_powerporttemplate
152	Can view power port template	38	view_powerporttemplate
153	Can add rack	39	add_rack
154	Can change rack	39	change_rack
155	Can delete rack	39	delete_rack
156	Can view rack	39	view_rack
157	Can add rack reservation	40	add_rackreservation
158	Can change rack reservation	40	change_rackreservation
159	Can delete rack reservation	40	delete_rackreservation
160	Can view rack reservation	40	view_rackreservation
161	Can add rack role	41	add_rackrole
162	Can change rack role	41	change_rackrole
163	Can delete rack role	41	delete_rackrole
164	Can view rack role	41	view_rackrole
165	Can add rear port	42	add_rearport
166	Can change rear port	42	change_rearport
167	Can delete rear port	42	delete_rearport
168	Can view rear port	42	view_rearport
169	Can add rear port template	43	add_rearporttemplate
170	Can change rear port template	43	change_rearporttemplate
171	Can delete rear port template	43	delete_rearporttemplate
172	Can view rear port template	43	view_rearporttemplate
173	Can add region	44	add_region
174	Can change region	44	change_region
175	Can delete region	44	delete_region
176	Can view region	44	view_region
177	Can add site	45	add_site
178	Can change site	45	change_site
179	Can delete site	45	delete_site
180	Can view site	45	view_site
181	Can add site group	46	add_sitegroup
182	Can change site group	46	change_sitegroup
183	Can delete site group	46	delete_sitegroup
184	Can view site group	46	view_sitegroup
185	Can add virtual chassis	47	add_virtualchassis
186	Can change virtual chassis	47	change_virtualchassis
187	Can delete virtual chassis	47	delete_virtualchassis
188	Can view virtual chassis	47	view_virtualchassis
189	Can add aggregate	48	add_aggregate
190	Can change aggregate	48	change_aggregate
191	Can delete aggregate	48	delete_aggregate
192	Can view aggregate	48	view_aggregate
193	Can add IP address	49	add_ipaddress
194	Can change IP address	49	change_ipaddress
195	Can delete IP address	49	delete_ipaddress
196	Can view IP address	49	view_ipaddress
197	Can add prefix	50	add_prefix
198	Can change prefix	50	change_prefix
199	Can delete prefix	50	delete_prefix
200	Can view prefix	50	view_prefix
201	Can add RIR	51	add_rir
202	Can change RIR	51	change_rir
203	Can delete RIR	51	delete_rir
204	Can view RIR	51	view_rir
205	Can add role	52	add_role
206	Can change role	52	change_role
207	Can delete role	52	delete_role
208	Can view role	52	view_role
209	Can add route target	53	add_routetarget
210	Can change route target	53	change_routetarget
211	Can delete route target	53	delete_routetarget
212	Can view route target	53	view_routetarget
213	Can add VRF	54	add_vrf
214	Can change VRF	54	change_vrf
215	Can delete VRF	54	delete_vrf
216	Can view VRF	54	view_vrf
217	Can add VLAN group	55	add_vlangroup
218	Can change VLAN group	55	change_vlangroup
219	Can delete VLAN group	55	delete_vlangroup
220	Can view VLAN group	55	view_vlangroup
221	Can add VLAN	56	add_vlan
222	Can change VLAN	56	change_vlan
223	Can delete VLAN	56	delete_vlan
224	Can view VLAN	56	view_vlan
225	Can add service	57	add_service
226	Can change service	57	change_service
227	Can delete service	57	delete_service
228	Can view service	57	view_service
229	Can add IP range	58	add_iprange
230	Can change IP range	58	change_iprange
231	Can delete IP range	58	delete_iprange
232	Can view IP range	58	view_iprange
233	Can add report	59	add_report
234	Can change report	59	change_report
235	Can delete report	59	delete_report
236	Can view report	59	view_report
237	Can add script	60	add_script
238	Can change script	60	change_script
239	Can delete script	60	delete_script
240	Can view script	60	view_script
241	Can add config context	61	add_configcontext
242	Can change config context	61	change_configcontext
243	Can delete config context	61	delete_configcontext
244	Can view config context	61	view_configcontext
245	Can add tag	62	add_tag
246	Can change tag	62	change_tag
247	Can delete tag	62	delete_tag
248	Can view tag	62	view_tag
249	Can add webhook	63	add_webhook
250	Can change webhook	63	change_webhook
251	Can delete webhook	63	delete_webhook
252	Can view webhook	63	view_webhook
253	Can add tagged item	64	add_taggeditem
254	Can change tagged item	64	change_taggeditem
255	Can delete tagged item	64	delete_taggeditem
256	Can view tagged item	64	view_taggeditem
257	Can add object change	65	add_objectchange
258	Can change object change	65	change_objectchange
259	Can delete object change	65	delete_objectchange
260	Can view object change	65	view_objectchange
261	Can add journal entry	66	add_journalentry
262	Can change journal entry	66	change_journalentry
263	Can delete journal entry	66	delete_journalentry
264	Can view journal entry	66	view_journalentry
265	Can add job result	67	add_jobresult
266	Can change job result	67	change_jobresult
267	Can delete job result	67	delete_jobresult
268	Can view job result	67	view_jobresult
269	Can add image attachment	68	add_imageattachment
270	Can change image attachment	68	change_imageattachment
271	Can delete image attachment	68	delete_imageattachment
272	Can view image attachment	68	view_imageattachment
273	Can add export template	69	add_exporttemplate
274	Can change export template	69	change_exporttemplate
275	Can delete export template	69	delete_exporttemplate
276	Can view export template	69	view_exporttemplate
277	Can add custom link	70	add_customlink
278	Can change custom link	70	change_customlink
279	Can delete custom link	70	delete_customlink
280	Can view custom link	70	view_customlink
281	Can add custom field	71	add_customfield
282	Can change custom field	71	change_customfield
283	Can delete custom field	71	delete_customfield
284	Can view custom field	71	view_customfield
285	Can add tenant group	72	add_tenantgroup
286	Can change tenant group	72	change_tenantgroup
287	Can delete tenant group	72	delete_tenantgroup
288	Can view tenant group	72	view_tenantgroup
289	Can add tenant	73	add_tenant
290	Can change tenant	73	change_tenant
291	Can delete tenant	73	delete_tenant
292	Can view tenant	73	view_tenant
293	Can add Group	74	add_admingroup
294	Can change Group	74	change_admingroup
295	Can delete Group	74	delete_admingroup
296	Can view Group	74	view_admingroup
297	Can add User	75	add_adminuser
298	Can change User	75	change_adminuser
299	Can delete User	75	delete_adminuser
300	Can view User	75	view_adminuser
301	Can add User Preferences	76	add_userconfig
302	Can change User Preferences	76	change_userconfig
303	Can delete User Preferences	76	delete_userconfig
304	Can view User Preferences	76	view_userconfig
306	Can change token	77	change_token
307	Can delete token	77	delete_token
308	Can view token	77	view_token
309	Can add permission	78	add_objectpermission
310	Can change permission	78	change_objectpermission
311	Can delete permission	78	delete_objectpermission
312	Can view permission	78	view_objectpermission
313	Can add cluster	79	add_cluster
314	Can change cluster	79	change_cluster
315	Can delete cluster	79	delete_cluster
316	Can view cluster	79	view_cluster
317	Can add cluster group	80	add_clustergroup
318	Can change cluster group	80	change_clustergroup
319	Can delete cluster group	80	delete_clustergroup
320	Can view cluster group	80	view_clustergroup
321	Can add cluster type	81	add_clustertype
322	Can change cluster type	81	change_clustertype
323	Can delete cluster type	81	delete_clustertype
324	Can view cluster type	81	view_clustertype
325	Can add virtual machine	82	add_virtualmachine
326	Can change virtual machine	82	change_virtualmachine
327	Can delete virtual machine	82	delete_virtualmachine
328	Can view virtual machine	82	view_virtualmachine
329	Can add interface	83	add_vminterface
330	Can change interface	83	change_vminterface
331	Can delete interface	83	delete_vminterface
332	Can view interface	83	view_vminterface
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$kywgFLvUciga5em4witCuV$pYqO75Mxnz7xIaXtFfL+QYwG1QdloQSTZ06vjdQ6K3E=	2023-05-30 13:49:31.694146+02	t	netbox			netbox@test.com	t	t	2023-05-26 12:10:21.944971+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuit; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuit (created, last_updated, custom_field_data, id, cid, status, install_date, commit_rate, description, comments, provider_id, tenant_id, termination_a_id, termination_z_id, type_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuittermination; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuittermination (created, last_updated, id, _cable_peer_id, mark_connected, term_side, port_speed, upstream_speed, xconnect_id, pp_info, description, _cable_peer_type_id, cable_id, circuit_id, provider_network_id, site_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuittype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuittype (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
\.


--
-- Data for Name: circuits_provider; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_provider (created, last_updated, custom_field_data, id, name, slug, asn, account, portal_url, noc_contact, admin_contact, comments) FROM stdin;
\.


--
-- Data for Name: circuits_providernetwork; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_providernetwork (created, last_updated, custom_field_data, id, name, description, comments, provider_id) FROM stdin;
\.


--
-- Data for Name: dcim_cable; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_cable (created, last_updated, custom_field_data, id, termination_a_id, termination_b_id, type, status, label, color, length, length_unit, _abs_length, _termination_a_device_id, _termination_b_device_id, termination_a_type_id, termination_b_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_cablepath; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_cablepath (id, origin_id, destination_id, path, is_active, is_split, destination_type_id, origin_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleport (created, last_updated, custom_field_data, id, name, _name, label, description, _cable_peer_id, mark_connected, type, speed, _cable_peer_type_id, _path_id, cable_id, device_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleporttemplate (created, last_updated, id, name, _name, label, description, type, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleserverport (created, last_updated, custom_field_data, id, name, _name, label, description, _cable_peer_id, mark_connected, type, speed, _cable_peer_type_id, _path_id, cable_id, device_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleserverporttemplate (created, last_updated, id, name, _name, label, description, type, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_device; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_device (created, last_updated, custom_field_data, id, local_context_data, name, _name, serial, asset_tag, "position", face, status, vc_position, vc_priority, comments, cluster_id, device_role_id, device_type_id, location_id, platform_id, primary_ip4_id, primary_ip6_id, rack_id, site_id, tenant_id, virtual_chassis_id) FROM stdin;
2023-05-30	2023-05-30 13:42:29.210411+02	{}	1	\N	router pcc4	router pcc00000004		\N	\N		active	\N	\N		\N	1	2	\N	\N	\N	\N	1	1	\N	\N
2023-05-31	2023-05-31 09:37:40.075653+02	{}	2	\N	Server BDD	Server BDD		\N	\N		active	\N	\N		\N	2	1	\N	\N	\N	\N	\N	1	\N	\N
2023-05-31	2023-05-31 09:38:51.422501+02	{}	3	\N	Switch PPC4	Switch PPC00000004		\N	\N		active	\N	\N		\N	3	2	\N	\N	\N	\N	\N	1	\N	\N
2023-05-31	2023-05-31 11:12:32.227617+02	{}	4	\N	\N	\N		\N	36	front	active	\N	\N		\N	1	2	\N	\N	\N	\N	1	1	\N	\N
\.


--
-- Data for Name: dcim_devicebay; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicebay (created, last_updated, custom_field_data, id, name, _name, label, description, device_id, installed_device_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicebaytemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicebaytemplate (created, last_updated, id, name, _name, label, description, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicerole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicerole (created, last_updated, custom_field_data, id, name, slug, color, vm_role, description) FROM stdin;
2023-05-30	2023-05-30 13:36:16.158816+02	{}	1	ROUTER	router	9e9e9e	t	
2023-05-31	2023-05-31 09:36:18.269153+02	{}	2	Server	server	9e9e9e	t	
2023-05-31	2023-05-31 09:38:14.294833+02	{}	3	Switch	switch	9e9e9e	t	
\.


--
-- Data for Name: dcim_devicetype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicetype (created, last_updated, custom_field_data, id, model, slug, part_number, u_height, is_full_depth, subdevice_role, front_image, rear_image, comments, manufacturer_id) FROM stdin;
2023-05-30	2023-05-30 13:03:44.767423+02	{}	1	hp1	hp1		1	t					1
2023-05-30	2023-05-30 13:37:44.644684+02	{}	2	2911	2911		1	t					2
\.


--
-- Data for Name: dcim_frontport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_frontport (created, last_updated, custom_field_data, id, name, _name, label, description, _cable_peer_id, mark_connected, type, rear_port_position, _cable_peer_type_id, cable_id, device_id, rear_port_id, color) FROM stdin;
\.


--
-- Data for Name: dcim_frontporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_frontporttemplate (created, last_updated, id, name, _name, label, description, type, rear_port_position, device_type_id, rear_port_id, color) FROM stdin;
\.


--
-- Data for Name: dcim_interface; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface (created, last_updated, custom_field_data, id, name, label, description, _cable_peer_id, mark_connected, enabled, mac_address, mtu, mode, _name, type, mgmt_only, _cable_peer_type_id, _path_id, cable_id, device_id, lag_id, parent_id, untagged_vlan_id) FROM stdin;
\.


--
-- Data for Name: dcim_interface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface_tagged_vlans (id, interface_id, vlan_id) FROM stdin;
\.


--
-- Data for Name: dcim_interfacetemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interfacetemplate (created, last_updated, id, name, label, description, _name, type, mgmt_only, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_inventoryitem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_inventoryitem (created, last_updated, custom_field_data, id, name, _name, label, description, part_id, serial, asset_tag, discovered, lft, rght, tree_id, level, device_id, manufacturer_id, parent_id) FROM stdin;
\.


--
-- Data for Name: dcim_location; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_location (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id, site_id) FROM stdin;
\.


--
-- Data for Name: dcim_manufacturer; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_manufacturer (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
2023-05-30	2023-05-30 13:03:11.449769+02	{}	1	HP	hp	
2023-05-30	2023-05-30 13:37:15.334098+02	{}	2	Cisco	cisco	
\.


--
-- Data for Name: dcim_platform; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_platform (created, last_updated, custom_field_data, id, name, slug, napalm_driver, napalm_args, description, manufacturer_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerfeed; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerfeed (created, last_updated, custom_field_data, id, _cable_peer_id, mark_connected, name, status, type, supply, phase, voltage, amperage, max_utilization, available_power, comments, _cable_peer_type_id, _path_id, cable_id, power_panel_id, rack_id) FROM stdin;
\.


--
-- Data for Name: dcim_poweroutlet; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_poweroutlet (created, last_updated, custom_field_data, id, name, _name, label, description, _cable_peer_id, mark_connected, type, feed_leg, _cable_peer_type_id, _path_id, cable_id, device_id, power_port_id) FROM stdin;
\.


--
-- Data for Name: dcim_poweroutlettemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_poweroutlettemplate (created, last_updated, id, name, _name, label, description, type, feed_leg, device_type_id, power_port_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerpanel; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerpanel (created, last_updated, custom_field_data, id, name, location_id, site_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerport (created, last_updated, custom_field_data, id, name, _name, label, description, _cable_peer_id, mark_connected, type, maximum_draw, allocated_draw, _cable_peer_type_id, _path_id, cable_id, device_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerporttemplate (created, last_updated, id, name, _name, label, description, type, maximum_draw, allocated_draw, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_rack; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rack (created, last_updated, custom_field_data, id, name, _name, facility_id, status, serial, asset_tag, type, width, u_height, desc_units, outer_width, outer_depth, outer_unit, comments, location_id, role_id, site_id, tenant_id) FROM stdin;
2023-05-30	2023-05-30 13:41:17.103388+02	{}	1	rack pcc4	rack pcc00000004	\N	active		\N		19	42	f	\N	\N			\N	\N	1	\N
\.


--
-- Data for Name: dcim_rackreservation; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackreservation (created, last_updated, custom_field_data, id, units, description, rack_id, tenant_id, user_id) FROM stdin;
\.


--
-- Data for Name: dcim_rackrole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackrole (created, last_updated, custom_field_data, id, name, slug, color, description) FROM stdin;
\.


--
-- Data for Name: dcim_rearport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rearport (created, last_updated, custom_field_data, id, name, _name, label, description, _cable_peer_id, mark_connected, type, positions, _cable_peer_type_id, cable_id, device_id, color) FROM stdin;
\.


--
-- Data for Name: dcim_rearporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rearporttemplate (created, last_updated, id, name, _name, label, description, type, positions, device_type_id, color) FROM stdin;
\.


--
-- Data for Name: dcim_region; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_region (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: dcim_site; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_site (created, last_updated, custom_field_data, id, name, _name, slug, status, facility, asn, time_zone, description, physical_address, shipping_address, latitude, longitude, contact_name, contact_phone, contact_email, comments, group_id, region_id, tenant_id) FROM stdin;
2023-05-30	2023-05-30 10:16:05.531892+02	{}	1	Projet Cloud Computing equipe 4	Projet Cloud Computing equipe 00000004	projet-cloud-computing-equipe-4	active		\N					\N	\N					\N	\N	\N
\.


--
-- Data for Name: dcim_sitegroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_sitegroup (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: dcim_virtualchassis; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_virtualchassis (created, last_updated, custom_field_data, id, name, domain, master_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-05-30 11:40:49.919492+02	1	089592 (netbox)	1	[{"added": {}}]	77	1
2	2023-05-30 11:41:02.349853+02	1	089592 (netbox)	2	[]	77	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	taggit	tag
8	taggit	taggeditem
9	circuits	circuit
10	circuits	circuittermination
11	circuits	circuittype
12	circuits	provider
13	circuits	providernetwork
14	dcim	cable
15	dcim	cablepath
16	dcim	consoleport
17	dcim	consoleporttemplate
18	dcim	consoleserverport
19	dcim	consoleserverporttemplate
20	dcim	device
21	dcim	devicebay
22	dcim	devicebaytemplate
23	dcim	devicerole
24	dcim	devicetype
25	dcim	frontport
26	dcim	frontporttemplate
27	dcim	interface
28	dcim	interfacetemplate
29	dcim	inventoryitem
30	dcim	location
31	dcim	manufacturer
32	dcim	platform
33	dcim	powerfeed
34	dcim	poweroutlet
35	dcim	poweroutlettemplate
36	dcim	powerpanel
37	dcim	powerport
38	dcim	powerporttemplate
39	dcim	rack
40	dcim	rackreservation
41	dcim	rackrole
42	dcim	rearport
43	dcim	rearporttemplate
44	dcim	region
45	dcim	site
46	dcim	sitegroup
47	dcim	virtualchassis
48	ipam	aggregate
49	ipam	ipaddress
50	ipam	prefix
51	ipam	rir
52	ipam	role
53	ipam	routetarget
54	ipam	vrf
55	ipam	vlangroup
56	ipam	vlan
57	ipam	service
58	ipam	iprange
59	extras	report
60	extras	script
61	extras	configcontext
62	extras	tag
63	extras	webhook
64	extras	taggeditem
65	extras	objectchange
66	extras	journalentry
67	extras	jobresult
68	extras	imageattachment
69	extras	exporttemplate
70	extras	customlink
71	extras	customfield
72	tenancy	tenantgroup
73	tenancy	tenant
74	users	admingroup
75	users	adminuser
76	users	userconfig
77	users	token
78	users	objectpermission
79	virtualization	cluster
80	virtualization	clustergroup
81	virtualization	clustertype
82	virtualization	virtualmachine
83	virtualization	vminterface
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-05-26 11:59:57.688838+02
2	auth	0001_initial	2023-05-26 11:59:57.897504+02
3	admin	0001_initial	2023-05-26 11:59:57.975242+02
4	admin	0002_logentry_remove_auto_add	2023-05-26 11:59:58.00601+02
5	admin	0003_logentry_add_action_flag_choices	2023-05-26 11:59:58.037167+02
6	contenttypes	0002_remove_content_type_name	2023-05-26 11:59:58.079183+02
7	auth	0002_alter_permission_name_max_length	2023-05-26 11:59:58.099713+02
8	auth	0003_alter_user_email_max_length	2023-05-26 11:59:58.118529+02
9	auth	0004_alter_user_username_opts	2023-05-26 11:59:58.135908+02
10	auth	0005_alter_user_last_login_null	2023-05-26 11:59:58.15533+02
11	auth	0006_require_contenttypes_0002	2023-05-26 11:59:58.16714+02
12	auth	0007_alter_validators_add_error_messages	2023-05-26 11:59:58.2019+02
13	auth	0008_alter_user_username_max_length	2023-05-26 11:59:58.245507+02
14	auth	0009_alter_user_last_name_max_length	2023-05-26 11:59:58.272203+02
15	auth	0010_alter_group_name_max_length	2023-05-26 11:59:58.301615+02
16	auth	0011_update_proxy_permissions	2023-05-26 11:59:58.33255+02
17	auth	0012_alter_user_first_name_max_length	2023-05-26 11:59:58.356721+02
18	extras	0001_initial	2023-05-26 11:59:59.027192+02
19	tenancy	0001_initial	2023-05-26 11:59:59.18309+02
20	tenancy	0002_tenant_group_optional	2023-05-26 11:59:59.194574+02
21	tenancy	0003_unicode_literals	2023-05-26 11:59:59.204631+02
22	tenancy	0004_tags	2023-05-26 11:59:59.215246+02
23	tenancy	0005_change_logging	2023-05-26 11:59:59.224284+02
24	tenancy	0006_custom_tag_models	2023-05-26 11:59:59.234317+02
25	tenancy	0007_nested_tenantgroups	2023-05-26 11:59:59.244452+02
26	tenancy	0008_nested_tenantgroups_rebuild	2023-05-26 11:59:59.255134+02
27	tenancy	0009_standardize_description	2023-05-26 11:59:59.264794+02
28	tenancy	0010_custom_field_data	2023-05-26 11:59:59.274472+02
29	tenancy	0011_standardize_name_length	2023-05-26 11:59:59.283721+02
30	tenancy	0012_standardize_models	2023-05-26 11:59:59.292914+02
31	dcim	0001_initial	2023-05-26 12:00:00.141199+02
32	circuits	0001_initial	2023-05-26 12:00:00.301956+02
33	circuits	0002_auto_20160622_1821	2023-05-26 12:00:00.794878+02
34	circuits	0003_provider_32bit_asn_support	2023-05-26 12:00:00.805073+02
35	circuits	0004_circuit_add_tenant	2023-05-26 12:00:00.815912+02
36	circuits	0005_circuit_add_upstream_speed	2023-05-26 12:00:00.826641+02
37	circuits	0006_terminations	2023-05-26 12:00:00.837002+02
38	circuits	0007_circuit_add_description	2023-05-26 12:00:00.847338+02
39	circuits	0008_circuittermination_interface_protect_on_delete	2023-05-26 12:00:00.857043+02
40	circuits	0009_unicode_literals	2023-05-26 12:00:00.867348+02
41	circuits	0010_circuit_status	2023-05-26 12:00:00.877526+02
42	circuits	0011_tags	2023-05-26 12:00:00.887514+02
43	circuits	0012_change_logging	2023-05-26 12:00:00.916386+02
44	circuits	0013_cables	2023-05-26 12:00:00.92677+02
45	circuits	0014_circuittermination_description	2023-05-26 12:00:00.936332+02
46	circuits	0015_custom_tag_models	2023-05-26 12:00:00.94655+02
47	circuits	0016_3569_circuit_fields	2023-05-26 12:00:00.956721+02
48	circuits	0017_circuittype_description	2023-05-26 12:00:00.967266+02
49	circuits	0018_standardize_description	2023-05-26 12:00:00.976658+02
50	circuits	0019_nullbooleanfield_to_booleanfield	2023-05-26 12:00:00.987754+02
51	circuits	0020_custom_field_data	2023-05-26 12:00:00.99855+02
52	circuits	0021_cache_cable_peer	2023-05-26 12:00:01.009609+02
53	circuits	0022_cablepath	2023-05-26 12:00:01.020899+02
54	circuits	0023_circuittermination_port_speed_optional	2023-05-26 12:00:01.031804+02
55	circuits	0024_standardize_name_length	2023-05-26 12:00:01.041333+02
56	circuits	0025_standardize_models	2023-05-26 12:00:01.050843+02
57	circuits	0026_mark_connected	2023-05-26 12:00:01.062772+02
58	circuits	0027_providernetwork	2023-05-26 12:00:01.07128+02
59	circuits	0028_cache_circuit_terminations	2023-05-26 12:00:01.078178+02
60	circuits	0029_circuit_tracing	2023-05-26 12:00:01.08479+02
61	dcim	0002_auto_20160622_1821	2023-05-26 12:00:03.669127+02
62	ipam	0001_initial	2023-05-26 12:00:04.28412+02
63	virtualization	0001_virtualization	2023-05-26 12:00:05.109183+02
64	virtualization	0002_virtualmachine_add_status	2023-05-26 12:00:05.121012+02
65	virtualization	0003_cluster_add_site	2023-05-26 12:00:05.13147+02
66	virtualization	0004_virtualmachine_add_role	2023-05-26 12:00:05.142196+02
67	virtualization	0005_django2	2023-05-26 12:00:05.154548+02
68	virtualization	0006_tags	2023-05-26 12:00:05.165855+02
69	virtualization	0007_change_logging	2023-05-26 12:00:05.177121+02
70	virtualization	0008_virtualmachine_local_context_data	2023-05-26 12:00:05.188312+02
71	virtualization	0009_custom_tag_models	2023-05-26 12:00:05.198818+02
72	virtualization	0010_cluster_add_tenant	2023-05-26 12:00:05.209211+02
73	virtualization	0011_3569_virtualmachine_fields	2023-05-26 12:00:05.220429+02
74	virtualization	0012_vm_name_nonunique	2023-05-26 12:00:05.231407+02
75	virtualization	0013_deterministic_ordering	2023-05-26 12:00:05.243846+02
76	virtualization	0014_standardize_description	2023-05-26 12:00:05.254975+02
77	virtualization	0015_vminterface	2023-05-26 12:00:05.267023+02
78	virtualization	0016_replicate_interfaces	2023-05-26 12:00:05.278605+02
79	virtualization	0017_update_jsonfield	2023-05-26 12:00:05.289343+02
80	virtualization	0018_custom_field_data	2023-05-26 12:00:05.300706+02
81	virtualization	0019_standardize_name_length	2023-05-26 12:00:05.312088+02
82	virtualization	0020_standardize_models	2023-05-26 12:00:05.32268+02
83	virtualization	0021_virtualmachine_vcpus_decimal	2023-05-26 12:00:05.334019+02
84	virtualization	0022_vminterface_parent	2023-05-26 12:00:05.345347+02
85	extras	0002_custom_fields	2023-05-26 12:00:06.726727+02
86	extras	0003_exporttemplate_add_description	2023-05-26 12:00:06.734815+02
87	extras	0004_topologymap_change_comma_to_semicolon	2023-05-26 12:00:06.742188+02
88	extras	0005_useraction_add_bulk_create	2023-05-26 12:00:06.752319+02
89	extras	0006_add_imageattachments	2023-05-26 12:00:06.763371+02
90	extras	0007_unicode_literals	2023-05-26 12:00:06.774619+02
91	extras	0008_reports	2023-05-26 12:00:06.785832+02
92	extras	0009_topologymap_type	2023-05-26 12:00:06.796561+02
93	extras	0010_customfield_filter_logic	2023-05-26 12:00:06.807829+02
94	extras	0011_django2	2023-05-26 12:00:06.819407+02
95	extras	0012_webhooks	2023-05-26 12:00:06.830531+02
96	extras	0013_objectchange	2023-05-26 12:00:06.84152+02
97	extras	0014_configcontexts	2023-05-26 12:00:06.852765+02
98	extras	0015_remove_useraction	2023-05-26 12:00:06.864303+02
99	extras	0016_exporttemplate_add_cable	2023-05-26 12:00:06.875472+02
100	extras	0017_exporttemplate_mime_type_length	2023-05-26 12:00:06.886462+02
101	extras	0018_exporttemplate_add_jinja2	2023-05-26 12:00:06.897852+02
102	extras	0019_tag_taggeditem	2023-05-26 12:00:06.90895+02
103	extras	0020_tag_data	2023-05-26 12:00:06.920895+02
104	extras	0021_add_color_comments_changelog_to_tag	2023-05-26 12:00:06.932925+02
105	extras	0022_custom_links	2023-05-26 12:00:06.944749+02
106	extras	0023_fix_tag_sequences	2023-05-26 12:00:06.957496+02
107	extras	0024_scripts	2023-05-26 12:00:06.968851+02
108	extras	0025_objectchange_time_index	2023-05-26 12:00:06.981414+02
109	extras	0026_webhook_ca_file_path	2023-05-26 12:00:06.990475+02
110	extras	0027_webhook_additional_headers	2023-05-26 12:00:06.998477+02
111	extras	0028_remove_topology_maps	2023-05-26 12:00:07.007096+02
112	extras	0029_3569_customfield_fields	2023-05-26 12:00:07.013966+02
113	extras	0030_3569_objectchange_fields	2023-05-26 12:00:07.024389+02
114	extras	0031_3569_exporttemplate_fields	2023-05-26 12:00:07.035934+02
115	extras	0032_3569_webhook_fields	2023-05-26 12:00:07.047411+02
116	extras	0033_graph_type_template_language	2023-05-26 12:00:07.058283+02
117	extras	0034_configcontext_tags	2023-05-26 12:00:07.070141+02
118	extras	0035_deterministic_ordering	2023-05-26 12:00:07.081614+02
119	extras	0036_contenttype_filters_to_q_objects	2023-05-26 12:00:07.09178+02
120	extras	0037_configcontexts_clusters	2023-05-26 12:00:07.102686+02
121	extras	0038_webhook_template_support	2023-05-26 12:00:07.113913+02
122	extras	0039_update_features_content_types	2023-05-26 12:00:07.124325+02
123	extras	0040_standardize_description	2023-05-26 12:00:07.135169+02
124	extras	0041_tag_description	2023-05-26 12:00:07.145447+02
125	extras	0042_customfield_manager	2023-05-26 12:00:07.155904+02
126	extras	0043_report	2023-05-26 12:00:07.166733+02
127	extras	0044_jobresult	2023-05-26 12:00:07.177963+02
128	extras	0045_configcontext_changelog	2023-05-26 12:00:07.189552+02
129	extras	0046_update_jsonfield	2023-05-26 12:00:07.201091+02
130	extras	0047_tag_ordering	2023-05-26 12:00:07.212618+02
131	extras	0048_exporttemplate_remove_template_language	2023-05-26 12:00:07.226316+02
132	extras	0049_remove_graph	2023-05-26 12:00:07.237548+02
133	extras	0050_customfield_changes	2023-05-26 12:00:07.248913+02
134	extras	0051_migrate_customfields	2023-05-26 12:00:07.260146+02
135	extras	0052_customfield_cleanup	2023-05-26 12:00:07.271293+02
136	extras	0053_rename_webhook_obj_type	2023-05-26 12:00:07.283104+02
137	extras	0054_standardize_models	2023-05-26 12:00:07.295642+02
138	extras	0055_objectchange_data	2023-05-26 12:00:07.307477+02
139	extras	0056_extend_configcontext	2023-05-26 12:00:07.321109+02
140	extras	0057_customlink_rename_fields	2023-05-26 12:00:07.332528+02
141	extras	0058_journalentry	2023-05-26 12:00:07.342918+02
142	extras	0059_exporttemplate_as_attachment	2023-05-26 12:00:07.350981+02
143	dcim	0003_auto_20160628_1721	2023-05-26 12:00:13.384549+02
144	dcim	0004_auto_20160701_2049	2023-05-26 12:00:13.39619+02
145	dcim	0005_auto_20160706_1722	2023-05-26 12:00:13.408228+02
146	dcim	0006_add_device_primary_ip4_ip6	2023-05-26 12:00:13.419364+02
147	dcim	0007_device_copy_primary_ip	2023-05-26 12:00:13.430032+02
148	dcim	0008_device_remove_primary_ip	2023-05-26 12:00:13.440955+02
149	dcim	0009_site_32bit_asn_support	2023-05-26 12:00:13.452203+02
150	dcim	0010_devicebay_installed_device_set_null	2023-05-26 12:00:13.463503+02
151	dcim	0011_devicetype_part_number	2023-05-26 12:00:13.475259+02
152	dcim	0012_site_rack_device_add_tenant	2023-05-26 12:00:13.487523+02
153	dcim	0013_add_interface_form_factors	2023-05-26 12:00:13.498841+02
154	dcim	0014_rack_add_type_width	2023-05-26 12:00:13.509516+02
155	dcim	0015_rack_add_u_height_validator	2023-05-26 12:00:13.521387+02
156	dcim	0016_module_add_manufacturer	2023-05-26 12:00:13.532319+02
157	dcim	0017_rack_add_role	2023-05-26 12:00:13.543722+02
158	dcim	0018_device_add_asset_tag	2023-05-26 12:00:13.554574+02
159	dcim	0019_new_iface_form_factors	2023-05-26 12:00:13.565074+02
160	dcim	0020_rack_desc_units	2023-05-26 12:00:13.57612+02
161	dcim	0021_add_ff_flexstack	2023-05-26 12:00:13.587048+02
162	dcim	0022_color_names_to_rgb	2023-05-26 12:00:13.59829+02
163	dcim	0023_devicetype_comments	2023-05-26 12:00:13.609531+02
164	dcim	0024_site_add_contact_fields	2023-05-26 12:00:13.620441+02
165	dcim	0025_devicetype_add_interface_ordering	2023-05-26 12:00:13.632972+02
166	dcim	0026_add_rack_reservations	2023-05-26 12:00:13.644179+02
167	dcim	0027_device_add_site	2023-05-26 12:00:13.656033+02
168	dcim	0028_device_copy_rack_to_site	2023-05-26 12:00:13.667582+02
169	dcim	0029_allow_rackless_devices	2023-05-26 12:00:13.679502+02
170	dcim	0030_interface_add_lag	2023-05-26 12:00:13.691615+02
171	dcim	0031_regions	2023-05-26 12:00:13.702182+02
172	dcim	0032_device_increase_name_length	2023-05-26 12:00:13.714212+02
173	dcim	0033_rackreservation_rack_editable	2023-05-26 12:00:13.725645+02
174	dcim	0034_rename_module_to_inventoryitem	2023-05-26 12:00:13.737153+02
175	dcim	0035_device_expand_status_choices	2023-05-26 12:00:13.748057+02
176	dcim	0036_add_ff_juniper_vcp	2023-05-26 12:00:13.759156+02
177	dcim	0037_unicode_literals	2023-05-26 12:00:13.771189+02
178	dcim	0038_wireless_interfaces	2023-05-26 12:00:13.781929+02
179	dcim	0039_interface_add_enabled_mtu	2023-05-26 12:00:13.792651+02
180	dcim	0040_inventoryitem_add_asset_tag_description	2023-05-26 12:00:13.803778+02
181	dcim	0041_napalm_integration	2023-05-26 12:00:13.815179+02
182	dcim	0042_interface_ff_10ge_cx4	2023-05-26 12:00:13.827022+02
183	dcim	0043_device_component_name_lengths	2023-05-26 12:00:13.838814+02
184	dcim	0044_virtualization	2023-05-26 12:00:13.849887+02
185	dcim	0045_devicerole_vm_role	2023-05-26 12:00:13.860066+02
186	dcim	0046_rack_lengthen_facility_id	2023-05-26 12:00:13.872025+02
187	dcim	0047_more_100ge_form_factors	2023-05-26 12:00:13.88386+02
188	dcim	0048_rack_serial	2023-05-26 12:00:13.89548+02
189	dcim	0049_rackreservation_change_user	2023-05-26 12:00:13.907256+02
190	dcim	0050_interface_vlan_tagging	2023-05-26 12:00:13.918847+02
191	dcim	0051_rackreservation_tenant	2023-05-26 12:00:13.931383+02
192	dcim	0052_virtual_chassis	2023-05-26 12:00:13.943266+02
193	dcim	0053_platform_manufacturer	2023-05-26 12:00:13.955723+02
194	dcim	0054_site_status_timezone_description	2023-05-26 12:00:13.968641+02
195	dcim	0055_virtualchassis_ordering	2023-05-26 12:00:13.980316+02
196	dcim	0056_django2	2023-05-26 12:00:13.991821+02
197	dcim	0057_tags	2023-05-26 12:00:14.00219+02
198	dcim	0058_relax_rack_naming_constraints	2023-05-26 12:00:14.012809+02
199	dcim	0059_site_latitude_longitude	2023-05-26 12:00:14.024395+02
200	dcim	0060_change_logging	2023-05-26 12:00:14.035942+02
201	dcim	0061_platform_napalm_args	2023-05-26 12:00:14.047584+02
202	dcim	0062_interface_mtu	2023-05-26 12:00:14.059697+02
203	dcim	0063_device_local_context_data	2023-05-26 12:00:14.070733+02
204	dcim	0064_remove_platform_rpc_client	2023-05-26 12:00:14.081704+02
205	dcim	0065_front_rear_ports	2023-05-26 12:00:14.092261+02
206	dcim	0066_cables	2023-05-26 12:00:14.103017+02
207	dcim	0067_device_type_remove_qualifiers	2023-05-26 12:00:14.113451+02
208	dcim	0068_rack_new_fields	2023-05-26 12:00:14.123908+02
209	dcim	0069_deprecate_nullablecharfield	2023-05-26 12:00:14.134894+02
210	dcim	0070_custom_tag_models	2023-05-26 12:00:14.146415+02
211	dcim	0071_device_components_add_description	2023-05-26 12:00:14.158395+02
212	dcim	0072_powerfeeds	2023-05-26 12:00:14.16937+02
213	dcim	0073_interface_form_factor_to_type	2023-05-26 12:00:14.181144+02
214	dcim	0074_increase_field_length_platform_name_slug	2023-05-26 12:00:14.19705+02
215	dcim	0075_cable_devices	2023-05-26 12:00:14.209285+02
216	dcim	0076_console_port_types	2023-05-26 12:00:14.221591+02
217	dcim	0077_power_types	2023-05-26 12:00:14.232596+02
218	dcim	0078_3569_site_fields	2023-05-26 12:00:14.243409+02
219	dcim	0079_3569_rack_fields	2023-05-26 12:00:14.25557+02
220	dcim	0080_3569_devicetype_fields	2023-05-26 12:00:14.26938+02
221	dcim	0081_3569_device_fields	2023-05-26 12:00:14.280674+02
222	dcim	0082_3569_interface_fields	2023-05-26 12:00:14.291357+02
223	dcim	0082_3569_port_fields	2023-05-26 12:00:14.307192+02
224	dcim	0083_3569_cable_fields	2023-05-26 12:00:14.319228+02
225	dcim	0084_3569_powerfeed_fields	2023-05-26 12:00:14.328892+02
226	dcim	0085_3569_poweroutlet_fields	2023-05-26 12:00:14.339258+02
227	dcim	0086_device_name_nonunique	2023-05-26 12:00:14.350162+02
228	dcim	0087_role_descriptions	2023-05-26 12:00:14.361755+02
229	dcim	0088_powerfeed_available_power	2023-05-26 12:00:14.373274+02
230	dcim	0089_deterministic_ordering	2023-05-26 12:00:14.384407+02
231	dcim	0090_cable_termination_models	2023-05-26 12:00:14.396429+02
232	dcim	0091_interface_type_other	2023-05-26 12:00:14.408266+02
233	dcim	0092_fix_rack_outer_unit	2023-05-26 12:00:14.420024+02
234	dcim	0093_device_component_ordering	2023-05-26 12:00:14.431476+02
235	dcim	0094_device_component_template_ordering	2023-05-26 12:00:14.442799+02
236	dcim	0095_primary_model_ordering	2023-05-26 12:00:14.454043+02
237	dcim	0096_interface_ordering	2023-05-26 12:00:14.465967+02
238	dcim	0097_interfacetemplate_type_other	2023-05-26 12:00:14.477281+02
239	dcim	0098_devicetype_images	2023-05-26 12:00:14.488428+02
240	dcim	0099_powerfeed_negative_voltage	2023-05-26 12:00:14.49882+02
241	dcim	0100_mptt_remove_indexes	2023-05-26 12:00:14.508933+02
242	dcim	0101_nested_rackgroups	2023-05-26 12:00:14.520404+02
243	dcim	0102_nested_rackgroups_rebuild	2023-05-26 12:00:14.532259+02
244	dcim	0103_standardize_description	2023-05-26 12:00:14.543525+02
245	dcim	0104_correct_infiniband_types	2023-05-26 12:00:14.554624+02
246	dcim	0105_interface_name_collation	2023-05-26 12:00:14.565614+02
247	dcim	0106_role_default_color	2023-05-26 12:00:14.577626+02
248	dcim	0107_component_labels	2023-05-26 12:00:14.590072+02
249	dcim	0108_add_tags	2023-05-26 12:00:14.601613+02
250	dcim	0109_interface_remove_vm	2023-05-26 12:00:14.613279+02
251	dcim	0110_virtualchassis_name	2023-05-26 12:00:14.624728+02
252	dcim	0111_component_template_description	2023-05-26 12:00:14.637311+02
253	dcim	0112_standardize_components	2023-05-26 12:00:14.648648+02
254	dcim	0113_nullbooleanfield_to_booleanfield	2023-05-26 12:00:14.660687+02
255	dcim	0114_update_jsonfield	2023-05-26 12:00:14.672791+02
256	dcim	0115_rackreservation_order	2023-05-26 12:00:14.683765+02
257	dcim	0116_rearport_max_positions	2023-05-26 12:00:14.695854+02
258	dcim	0117_custom_field_data	2023-05-26 12:00:14.706966+02
259	dcim	0118_inventoryitem_mptt	2023-05-26 12:00:14.718276+02
260	dcim	0119_inventoryitem_mptt_rebuild	2023-05-26 12:00:14.729394+02
261	dcim	0120_cache_cable_peer	2023-05-26 12:00:14.740127+02
262	dcim	0121_cablepath	2023-05-26 12:00:14.751182+02
263	dcim	0122_standardize_name_length	2023-05-26 12:00:14.761557+02
264	dcim	0123_standardize_models	2023-05-26 12:00:14.772288+02
265	dcim	0124_mark_connected	2023-05-26 12:00:14.783268+02
266	dcim	0125_console_port_speed	2023-05-26 12:00:14.794685+02
267	dcim	0126_rename_rackgroup_location	2023-05-26 12:00:14.806491+02
268	dcim	0127_device_location	2023-05-26 12:00:14.818103+02
269	dcim	0128_device_location_populate	2023-05-26 12:00:14.829185+02
270	dcim	0129_interface_parent	2023-05-26 12:00:14.841312+02
271	dcim	0130_sitegroup	2023-05-26 12:00:14.85291+02
272	dcim	0131_consoleport_speed	2023-05-26 12:00:15.224412+02
273	dcim	0132_cable_length	2023-05-26 12:00:15.364706+02
274	dcim	0133_port_colors	2023-05-26 12:00:15.586022+02
275	extras	0060_customlink_button_class	2023-05-26 12:00:15.626886+02
276	extras	0061_extras_change_logging	2023-05-26 12:00:15.891362+02
277	ipam	0002_vrf_add_enforce_unique	2023-05-26 12:00:17.822606+02
278	ipam	0003_ipam_add_vlangroups	2023-05-26 12:00:17.831536+02
279	ipam	0004_ipam_vlangroup_uniqueness	2023-05-26 12:00:17.839598+02
280	ipam	0005_auto_20160725_1842	2023-05-26 12:00:17.848277+02
281	ipam	0006_vrf_vlan_add_tenant	2023-05-26 12:00:17.856516+02
282	ipam	0007_prefix_ipaddress_add_tenant	2023-05-26 12:00:17.865227+02
283	ipam	0008_prefix_change_order	2023-05-26 12:00:17.874331+02
284	ipam	0009_ipaddress_add_status	2023-05-26 12:00:17.882294+02
285	ipam	0010_ipaddress_help_texts	2023-05-26 12:00:17.89109+02
286	ipam	0011_rir_add_is_private	2023-05-26 12:00:17.901276+02
287	ipam	0012_services	2023-05-26 12:00:17.911262+02
288	ipam	0013_prefix_add_is_pool	2023-05-26 12:00:17.921334+02
289	ipam	0014_ipaddress_status_add_deprecated	2023-05-26 12:00:17.931255+02
290	ipam	0015_global_vlans	2023-05-26 12:00:17.941145+02
291	ipam	0016_unicode_literals	2023-05-26 12:00:17.952574+02
292	ipam	0017_ipaddress_roles	2023-05-26 12:00:17.96508+02
293	ipam	0018_remove_service_uniqueness_constraint	2023-05-26 12:00:17.976068+02
294	ipam	0019_virtualization	2023-05-26 12:00:17.9871+02
295	ipam	0020_ipaddress_add_role_carp	2023-05-26 12:00:17.998365+02
296	ipam	0021_vrf_ordering	2023-05-26 12:00:18.010202+02
297	ipam	0022_tags	2023-05-26 12:00:18.021063+02
298	ipam	0023_change_logging	2023-05-26 12:00:18.031891+02
299	ipam	0024_vrf_allow_null_rd	2023-05-26 12:00:18.044807+02
300	ipam	0025_custom_tag_models	2023-05-26 12:00:18.057059+02
301	ipam	0026_prefix_ordering_vrf_nulls_first	2023-05-26 12:00:18.068394+02
302	ipam	0027_ipaddress_add_dns_name	2023-05-26 12:00:18.079625+02
303	ipam	0028_3569_prefix_fields	2023-05-26 12:00:18.09149+02
304	ipam	0029_3569_ipaddress_fields	2023-05-26 12:00:18.102837+02
305	ipam	0030_3569_vlan_fields	2023-05-26 12:00:18.113345+02
306	ipam	0031_3569_service_fields	2023-05-26 12:00:18.12533+02
307	ipam	0032_role_description	2023-05-26 12:00:18.136856+02
308	ipam	0033_deterministic_ordering	2023-05-26 12:00:18.14804+02
309	ipam	0034_fix_ipaddress_status_dhcp	2023-05-26 12:00:18.159369+02
310	ipam	0035_drop_ip_family	2023-05-26 12:00:18.170901+02
311	ipam	0036_standardize_description	2023-05-26 12:00:18.181749+02
312	ipam	0037_ipaddress_assignment	2023-05-26 12:00:18.192966+02
313	ipam	0038_custom_field_data	2023-05-26 12:00:18.204864+02
314	ipam	0039_service_ports_array	2023-05-26 12:00:18.215387+02
315	ipam	0040_service_drop_port	2023-05-26 12:00:18.226211+02
316	ipam	0041_routetarget	2023-05-26 12:00:18.237056+02
317	ipam	0042_standardize_name_length	2023-05-26 12:00:18.248417+02
318	ipam	0043_add_tenancy_to_aggregates	2023-05-26 12:00:18.259694+02
319	ipam	0044_standardize_models	2023-05-26 12:00:18.271007+02
320	ipam	0045_vlangroup_scope	2023-05-26 12:00:18.283049+02
321	ipam	0046_set_vlangroup_scope_types	2023-05-26 12:00:18.294361+02
322	ipam	0047_prefix_depth_children	2023-05-26 12:00:18.456388+02
323	ipam	0048_prefix_populate_depth_children	2023-05-26 12:00:18.712765+02
324	ipam	0049_prefix_mark_utilized	2023-05-26 12:00:18.796405+02
325	ipam	0050_iprange	2023-05-26 12:00:18.934757+02
326	sessions	0001_initial	2023-05-26 12:00:18.983711+02
327	taggit	0001_initial	2023-05-26 12:00:19.1736+02
328	taggit	0002_auto_20150616_2121	2023-05-26 12:00:19.249755+02
329	taggit	0003_taggeditem_add_unique_index	2023-05-26 12:00:19.299841+02
330	users	0001_api_tokens	2023-05-26 12:00:19.873739+02
331	users	0002_unicode_literals	2023-05-26 12:00:19.882246+02
332	users	0003_token_permissions	2023-05-26 12:00:19.891287+02
333	users	0004_standardize_description	2023-05-26 12:00:19.900596+02
334	users	0005_userconfig	2023-05-26 12:00:19.909502+02
335	users	0006_create_userconfigs	2023-05-26 12:00:19.917927+02
336	users	0007_proxy_group_user	2023-05-26 12:00:19.929644+02
337	users	0008_objectpermission	2023-05-26 12:00:19.940876+02
338	users	0009_replicate_permissions	2023-05-26 12:00:19.952292+02
339	users	0010_update_jsonfield	2023-05-26 12:00:19.963411+02
340	users	0011_standardize_models	2023-05-26 12:00:19.975164+02
341	virtualization	0023_virtualmachine_natural_ordering	2023-05-26 12:00:20.195803+02
342	circuits	0001_squashed	2023-05-26 12:00:20.226831+02
343	circuits	0002_squashed_0029	2023-05-26 12:00:20.238137+02
344	dcim	0002_squashed	2023-05-26 12:00:20.249808+02
345	dcim	0001_squashed	2023-05-26 12:00:20.261002+02
346	dcim	0003_squashed_0130	2023-05-26 12:00:20.274035+02
347	ipam	0001_squashed	2023-05-26 12:00:20.285605+02
348	ipam	0002_squashed_0046	2023-05-26 12:00:20.297347+02
349	extras	0001_squashed	2023-05-26 12:00:20.308903+02
350	extras	0002_squashed_0059	2023-05-26 12:00:20.319653+02
351	tenancy	0001_squashed_0012	2023-05-26 12:00:20.330933+02
352	users	0001_squashed_0011	2023-05-26 12:00:20.341892+02
353	virtualization	0001_squashed_0022	2023-05-26 12:00:20.353276+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
902d9cy4roicka8ppsndjk6lsz1e4dpw	.eJxVjEsKwjAQQO-StRSmk69LL6A3CDPpSKKYQpOCIN7dFlzo9r3He6lIa89xbbLEMqmjAnX4ZUzpLnUXVTrPz2FXUntJ1MtchzPfJPWLLI_S2gZO3_5vkqnl7UAUgsjkUIcrGeudRQbrEVnzBEIIGHRIybjRWQPgtYFR2DjQKB69en8AL145GA:1q2VPK:pVeMPV5Dwx3A2Bh-1AlFKWr3oIEA2aPTWNMhCt6EnSQ	2023-06-09 13:14:54.68368+02
e0a0hxyhrlgxt4ffi7rpiu8iod7s0aex	.eJxVjEsKwjAQQO-StRSmk69LL6A3CDPpSKKYQpOCIN7dFlzo9r3He6lIa89xbbLEMqmjAnX4ZUzpLnUXVTrPz2FXUntJ1MtchzPfJPWLLI_S2gZO3_5vkqnl7UAUgsjkUIcrGeudRQbrEVnzBEIIGHRIybjRWQPgtYFR2DjQKB69en8AL145GA:1q2VeM:0k6fKUqLK6m7qg1wTT4HtMWLkqNrOnhSk0sLW5JWxaU	2023-06-09 13:30:26.744742+02
pn6rxvblz5dq2sny7x8lagcq9fty3e4t	.eJxVjEsKwjAQQO-StRSmk69LL6A3CDPpSKKYQpOCIN7dFlzo9r3He6lIa89xbbLEMqmjAnX4ZUzpLnUXVTrPz2FXUntJ1MtchzPfJPWLLI_S2gZO3_5vkqnl7UAUgsjkUIcrGeudRQbrEVnzBEIIGHRIybjRWQPgtYFR2DjQKB69en8AL145GA:1q3uKy:XDdPfUWbL47MYs2WfNLk4iTkF8Z6te9lzGeTziyEROM	2023-06-13 10:04:12.715455+02
cwyt6edaia4gu8zk5o7t2kaaovwq9qrv	.eJxVjEsKwjAQQO-StRSmk69LL6A3CDPpSKKYQpOCIN7dFlzo9r3He6lIa89xbbLEMqmjAnX4ZUzpLnUXVTrPz2FXUntJ1MtchzPfJPWLLI_S2gZO3_5vkqnl7UAUgsjkUIcrGeudRQbrEVnzBEIIGHRIybjRWQPgtYFR2DjQKB69en8AL145GA:1q3xr1:ZPAhcWxmGp7z45-9Qc0DaEoDwknm1J-0Lch3rt8CYYo	2023-06-13 13:49:31.813297+02
\.


--
-- Data for Name: extras_configcontext; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext (created, last_updated, id, name, weight, description, is_active, data) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_cluster_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_cluster_groups (id, configcontext_id, clustergroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_clusters; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_clusters (id, configcontext_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_device_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_device_types (id, configcontext_id, devicetype_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_platforms; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_platforms (id, configcontext_id, platform_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_regions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_regions (id, configcontext_id, region_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_roles; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_roles (id, configcontext_id, devicerole_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_site_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_site_groups (id, configcontext_id, sitegroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_sites; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_sites (id, configcontext_id, site_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tags; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tags (id, configcontext_id, tag_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenant_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tenant_groups (id, configcontext_id, tenantgroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenants; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tenants (id, configcontext_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: extras_customfield; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfield (id, type, name, label, description, required, filter_logic, "default", weight, validation_minimum, validation_maximum, validation_regex, choices, created, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_customfield_content_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfield_content_types (id, customfield_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: extras_customlink; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customlink (id, name, link_text, link_url, weight, group_name, button_class, new_window, content_type_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_exporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_exporttemplate (id, name, description, template_code, mime_type, file_extension, as_attachment, content_type_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_imageattachment; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_imageattachment (id, object_id, image, image_height, image_width, name, created, content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_jobresult; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_jobresult (id, name, created, completed, status, data, job_id, obj_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: extras_journalentry; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_journalentry (last_updated, id, assigned_object_id, created, kind, comments, assigned_object_type_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: extras_objectchange; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_objectchange (id, "time", user_name, request_id, action, changed_object_id, related_object_id, object_repr, prechange_data, postchange_data, changed_object_type_id, related_object_type_id, user_id) FROM stdin;
1	2023-05-30 10:16:05.564132+02	netbox	685e8e69-4af2-415e-8fd0-1f24b070e56a	create	1	\N	Projet Cloud Computing equipe 4	\N	{"asn": null, "name": "Projet Cloud Computing equipe 4", "slug": "projet-cloud-computing-equipe-4", "tags": [], "group": null, "region": null, "status": "active", "tenant": null, "created": "2023-05-30", "comments": "", "facility": "", "latitude": null, "longitude": null, "time_zone": null, "description": "", "contact_name": "", "last_updated": "2023-05-30T08:16:05.531Z", "contact_email": "", "contact_phone": "", "custom_fields": {}, "physical_address": "", "shipping_address": ""}	45	\N	1
2	2023-05-30 11:34:54.638048+02	netbox	81f2eb46-c663-4d6e-9c82-db1767a5d44d	create	1	\N	Base de donnée	\N	{"name": "Base de donnée", "slug": "base-de-donne", "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T09:34:54.628Z", "custom_fields": {}}	81	\N	1
3	2023-05-30 11:35:36.831066+02	netbox	eaaf345b-70c9-49b0-8fbe-0512587ef59c	create	1	\N	BDD	\N	{"name": "BDD", "site": null, "tags": [], "type": 1, "group": null, "tenant": null, "created": "2023-05-30", "comments": "", "last_updated": "2023-05-30T09:35:36.808Z", "custom_fields": {}}	79	\N	1
5	2023-05-30 11:44:27.383145+02	netbox	60045f94-ba08-42e8-a9b6-10075d0722c5	delete	1	\N	VM-db-gitea	{"disk": null, "name": "VM-db-gitea", "role": null, "tags": [], "vcpus": null, "memory": null, "status": "active", "tenant": null, "cluster": 1, "created": "2023-05-30", "comments": "", "platform": null, "primary_ip4": null, "primary_ip6": null, "last_updated": "2023-05-30T09:41:40.075Z", "custom_fields": {}, "local_context_data": null}	\N	82	\N	1
7	2023-05-30 11:45:36.378317+02	netbox	119a01c3-21df-4d11-95b6-12daf55ed4b2	update	1	\N	BDD	{"name": "BDD", "site": null, "tags": [], "type": 1, "group": null, "tenant": null, "created": "2023-05-30", "comments": "", "last_updated": "2023-05-30T09:35:36.808Z", "custom_fields": {}}	{"name": "BDD", "site": 1, "tags": [], "type": 1, "group": null, "tenant": null, "created": "2023-05-30", "comments": "", "last_updated": "2023-05-30T09:45:36.365Z", "custom_fields": {}}	79	\N	1
8	2023-05-30 12:52:38.977579+02	netbox	29309380-7a47-41dc-a1af-4be97425bb07	delete	2	\N	VM-db-gitea	{"disk": null, "name": "VM-db-gitea", "role": null, "tags": [], "vcpus": null, "memory": null, "status": "active", "tenant": null, "cluster": 1, "created": "2023-05-30", "comments": "", "platform": null, "primary_ip4": null, "primary_ip6": null, "last_updated": "2023-05-30T09:44:31.325Z", "custom_fields": {}, "local_context_data": null}	\N	82	\N	1
9	2023-05-30 13:03:11.471944+02	netbox	0d234fa9-3dde-455a-a6ef-950eefe9e950	create	1	\N	HP	\N	{"name": "HP", "slug": "hp", "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:03:11.449Z", "custom_fields": {}}	31	\N	1
10	2023-05-30 13:03:44.787535+02	netbox	eff1820e-4dd9-4c62-b0ac-8431de3ceec9	create	1	\N	hp1	\N	{"slug": "hp1", "tags": [], "model": "hp1", "created": "2023-05-30", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2023-05-30T11:03:44.767Z", "manufacturer": 1, "custom_fields": {}, "is_full_depth": true, "subdevice_role": ""}	24	\N	1
11	2023-05-30 13:15:49.077717+02	netbox	4d6ad9cc-69e2-47a4-be34-971f7529a3ad	create	1	\N	DMZ (1)	\N	{"vid": 1, "name": "DMZ", "role": null, "site": null, "tags": [], "group": null, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:15:49.055Z", "custom_fields": {}}	56	\N	1
12	2023-05-30 13:18:15.597154+02	netbox	bdbe5c31-19e7-480e-be50-e5d14949d4ab	create	2	\N	ADMIN (2)	\N	{"vid": 2, "name": "ADMIN", "role": null, "site": null, "tags": [], "group": null, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:18:15.580Z", "custom_fields": {}}	56	\N	1
13	2023-05-30 13:18:36.700808+02	netbox	313351d9-6f36-418a-9e19-f9b5ca87302f	create	3	\N	MANAGEMENT (3)	\N	{"vid": 3, "name": "MANAGEMENT", "role": null, "site": null, "tags": [], "group": null, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:18:36.688Z", "custom_fields": {}}	56	\N	1
14	2023-05-30 13:19:44.0683+02	netbox	dae327ba-cdec-4b2b-bd93-a3a214c5b719	update	1	\N	DMZ (1)	{"vid": 1, "name": "DMZ", "role": null, "site": null, "tags": [], "group": null, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:15:49.055Z", "custom_fields": {}}	{"vid": 1, "name": "DMZ", "role": null, "site": null, "tags": [], "group": null, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:19:44.052Z", "custom_fields": {}}	56	\N	1
16	2023-05-30 13:20:55.471114+02	netbox	cfea4e87-14c4-4f7c-bcd2-ee433841863e	update	1	\N	DMZ (1)	{"vid": 1, "name": "DMZ", "role": null, "site": null, "tags": [], "group": null, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:19:44.052Z", "custom_fields": {}}	{"vid": 1, "name": "DMZ", "role": null, "site": null, "tags": [], "group": 1, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:20:55.457Z", "custom_fields": {}}	56	\N	1
17	2023-05-30 13:21:12.996877+02	netbox	fc0f916c-1278-44d1-81a3-aec9b9113d61	update	2	\N	ADMIN (2)	{"vid": 2, "name": "ADMIN", "role": null, "site": null, "tags": [], "group": null, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:18:15.580Z", "custom_fields": {}}	{"vid": 2, "name": "ADMIN", "role": null, "site": null, "tags": [], "group": 1, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:21:12.983Z", "custom_fields": {}}	56	\N	1
18	2023-05-30 13:21:27.275597+02	netbox	27d488f2-ffb8-4fae-87ee-7ab6618ee9b5	update	3	\N	MANAGEMENT (3)	{"vid": 3, "name": "MANAGEMENT", "role": null, "site": null, "tags": [], "group": null, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:18:36.688Z", "custom_fields": {}}	{"vid": 3, "name": "MANAGEMENT", "role": null, "site": null, "tags": [], "group": 1, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:21:27.264Z", "custom_fields": {}}	56	\N	1
26	2023-05-30 13:23:44.708304+02	netbox	7176cecf-36e7-4d4d-8239-ffbb19138fe0	create	4	\N	BDD (4)	\N	{"vid": 4, "name": "BDD", "role": null, "site": null, "tags": [], "group": null, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:23:44.693Z", "custom_fields": {}}	56	\N	1
19	2023-05-30 13:22:23.28176+02	netbox	332b4489-ae53-486f-89f7-4ecca9e4ea94	update	1	\N	DMZ (1)	{"vid": 1, "name": "DMZ", "role": null, "site": null, "tags": [], "group": 1, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:20:55.457Z", "custom_fields": {}}	{"vid": 1, "name": "DMZ", "role": null, "site": 1, "tags": [], "group": 1, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:22:23.269Z", "custom_fields": {}}	56	\N	1
20	2023-05-30 13:22:23.364136+02	netbox	332b4489-ae53-486f-89f7-4ecca9e4ea94	update	2	\N	ADMIN (2)	{"vid": 2, "name": "ADMIN", "role": null, "site": null, "tags": [], "group": 1, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:21:12.983Z", "custom_fields": {}}	{"vid": 2, "name": "ADMIN", "role": null, "site": 1, "tags": [], "group": 1, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:22:23.352Z", "custom_fields": {}}	56	\N	1
21	2023-05-30 13:22:23.451087+02	netbox	332b4489-ae53-486f-89f7-4ecca9e4ea94	update	3	\N	MANAGEMENT (3)	{"vid": 3, "name": "MANAGEMENT", "role": null, "site": null, "tags": [], "group": 1, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:21:27.264Z", "custom_fields": {}}	{"vid": 3, "name": "MANAGEMENT", "role": null, "site": 1, "tags": [], "group": 1, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:22:23.438Z", "custom_fields": {}}	56	\N	1
22	2023-05-30 13:22:41.122593+02	netbox	294e824a-f13d-4a5b-a11b-371b2d6b9143	update	1	\N	DMZ (1)	{"vid": 1, "name": "DMZ", "role": null, "site": 1, "tags": [], "group": 1, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:22:23.269Z", "custom_fields": {}}	{"vid": 1, "name": "DMZ", "role": null, "site": 1, "tags": [], "group": null, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:22:41.111Z", "custom_fields": {}}	56	\N	1
23	2023-05-30 13:22:41.18769+02	netbox	294e824a-f13d-4a5b-a11b-371b2d6b9143	update	2	\N	ADMIN (2)	{"vid": 2, "name": "ADMIN", "role": null, "site": 1, "tags": [], "group": 1, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:22:23.352Z", "custom_fields": {}}	{"vid": 2, "name": "ADMIN", "role": null, "site": 1, "tags": [], "group": null, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:22:41.175Z", "custom_fields": {}}	56	\N	1
24	2023-05-30 13:22:41.254559+02	netbox	294e824a-f13d-4a5b-a11b-371b2d6b9143	update	3	\N	MANAGEMENT (3)	{"vid": 3, "name": "MANAGEMENT", "role": null, "site": 1, "tags": [], "group": 1, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:22:23.438Z", "custom_fields": {}}	{"vid": 3, "name": "MANAGEMENT", "role": null, "site": 1, "tags": [], "group": null, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:22:41.241Z", "custom_fields": {}}	56	\N	1
25	2023-05-30 13:22:49.11571+02	netbox	caec7d33-208c-418a-95c3-5497e294378e	delete	1	\N	VLAN infra	{"name": "VLAN infra", "slug": "vlan-infra", "created": "2023-05-30", "scope_id": 1, "scope_type": 45, "description": "", "last_updated": "2023-05-30T11:20:42.563Z", "custom_fields": {}}	\N	55	\N	1
27	2023-05-30 13:24:01.087195+02	netbox	02a4f8b0-7761-4ad4-aa4b-0632fef6f6db	create	5	\N	WEB (5)	\N	{"vid": 5, "name": "WEB", "role": null, "site": null, "tags": [], "group": null, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:24:01.071Z", "custom_fields": {}}	56	\N	1
28	2023-05-30 13:24:13.884557+02	netbox	9e2cc0c9-5682-4337-9be4-0abaa699c567	update	4	\N	BDD (4)	{"vid": 4, "name": "BDD", "role": null, "site": null, "tags": [], "group": null, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:23:44.693Z", "custom_fields": {}}	{"vid": 4, "name": "BDD", "role": null, "site": 1, "tags": [], "group": null, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:24:13.869Z", "custom_fields": {}}	56	\N	1
29	2023-05-30 13:24:13.938554+02	netbox	9e2cc0c9-5682-4337-9be4-0abaa699c567	update	5	\N	WEB (5)	{"vid": 5, "name": "WEB", "role": null, "site": null, "tags": [], "group": null, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:24:01.071Z", "custom_fields": {}}	{"vid": 5, "name": "WEB", "role": null, "site": 1, "tags": [], "group": null, "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:24:13.931Z", "custom_fields": {}}	56	\N	1
31	2023-05-30 13:29:30.349008+02	netbox	0d36eb25-58f8-4603-8d58-4960ae2c697a	create	1	\N	172.16.0.0/24	\N	{"vrf": null, "role": null, "site": 1, "tags": [], "vlan": 5, "prefix": "172.16.0.0/24", "status": "active", "tenant": null, "created": "2023-05-30", "is_pool": false, "description": "", "last_updated": "2023-05-30T11:29:30.329Z", "custom_fields": {}, "mark_utilized": false}	50	\N	1
32	2023-05-30 13:29:47.699657+02	netbox	cbc412a4-1feb-4511-a62d-45d43659c4bf	delete	1	\N	172.16.0.0-255/24	{"vrf": null, "role": null, "size": 256, "tags": [], "status": "active", "tenant": null, "created": "2023-05-30", "description": "", "end_address": "172.16.0.255/24", "last_updated": "2023-05-30T11:27:00.715Z", "custom_fields": {}, "start_address": "172.16.0.0/24"}	\N	58	\N	1
33	2023-05-30 13:30:24.042122+02	netbox	69b961ff-0eed-4f66-a70d-b30977c9bfe3	create	2	\N	172.16.1.0/24	\N	{"vrf": null, "role": null, "site": 1, "tags": [], "vlan": 4, "prefix": "172.16.1.0/24", "status": "active", "tenant": null, "created": "2023-05-30", "is_pool": false, "description": "", "last_updated": "2023-05-30T11:30:24.004Z", "custom_fields": {}, "mark_utilized": false}	50	\N	1
34	2023-05-30 13:30:54.499093+02	netbox	d19f1c90-f4cf-4097-aba9-10789bdff752	create	3	\N	172.16.2.0/28	\N	{"vrf": null, "role": null, "site": 1, "tags": [], "vlan": 2, "prefix": "172.16.2.0/28", "status": "active", "tenant": null, "created": "2023-05-30", "is_pool": false, "description": "", "last_updated": "2023-05-30T11:30:54.465Z", "custom_fields": {}, "mark_utilized": false}	50	\N	1
35	2023-05-30 13:31:52.311744+02	netbox	24749367-ef72-4bf6-9fd2-bf76273536a5	create	4	\N	172.16.2.16/28	\N	{"vrf": null, "role": null, "site": 1, "tags": [], "vlan": 1, "prefix": "172.16.2.16/28", "status": "active", "tenant": null, "created": "2023-05-30", "is_pool": false, "description": "", "last_updated": "2023-05-30T11:31:52.260Z", "custom_fields": {}, "mark_utilized": false}	50	\N	1
36	2023-05-30 13:32:14.771992+02	netbox	fd72cf5b-ce82-4024-aec8-3a71aa72f845	create	5	\N	172.16.2.32/28	\N	{"vrf": null, "role": null, "site": 1, "tags": [], "vlan": 3, "prefix": "172.16.2.32/28", "status": "active", "tenant": null, "created": "2023-05-30", "is_pool": false, "description": "", "last_updated": "2023-05-30T11:32:14.729Z", "custom_fields": {}, "mark_utilized": false}	50	\N	1
37	2023-05-30 13:36:16.163288+02	netbox	098a7e69-cdb2-4edb-84bd-a2d9762230ff	create	1	\N	ROUTER	\N	{"name": "ROUTER", "slug": "router", "color": "9e9e9e", "created": "2023-05-30", "vm_role": true, "description": "", "last_updated": "2023-05-30T11:36:16.158Z", "custom_fields": {}}	23	\N	1
38	2023-05-30 13:37:15.341679+02	netbox	bb935eb2-697f-463f-bf3a-4edf35cec28a	create	2	\N	Cisco	\N	{"name": "Cisco", "slug": "cisco", "created": "2023-05-30", "description": "", "last_updated": "2023-05-30T11:37:15.334Z", "custom_fields": {}}	31	\N	1
39	2023-05-30 13:37:44.659112+02	netbox	0fbd2fcd-e908-4a43-aefd-e1b5f476100a	create	2	\N	2911	\N	{"slug": "2911", "tags": [], "model": "2911", "created": "2023-05-30", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2023-05-30T11:37:44.644Z", "manufacturer": 2, "custom_fields": {}, "is_full_depth": true, "subdevice_role": ""}	24	\N	1
40	2023-05-30 13:40:08.230206+02	netbox	af5b07d8-c551-4867-a752-0b7e1cc3ebb7	create	1	\N	router pcc4	\N	{"face": "", "name": "router pcc4", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2023-05-30", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2023-05-30T11:40:08.212Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	20	\N	1
41	2023-05-30 13:41:17.118831+02	netbox	52b8ff6e-3fb9-471b-a81f-027a1b31057c	create	1	\N	rack pcc4	\N	{"name": "rack pcc4", "role": null, "site": 1, "tags": [], "type": "", "width": 19, "serial": "", "status": "active", "tenant": null, "created": "2023-05-30", "comments": "", "location": null, "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": "", "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2023-05-30T11:41:17.103Z", "custom_fields": {}}	39	\N	1
42	2023-05-30 13:42:29.220019+02	netbox	3f970db6-fd25-4596-9bae-692e3184ed4d	update	1	\N	router pcc4	{"face": "", "name": "router pcc4", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2023-05-30", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2023-05-30T11:40:08.212Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "router pcc4", "rack": 1, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2023-05-30", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2023-05-30T11:42:29.210Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	20	\N	1
44	2023-05-31 09:30:25.777858+02	netbox	0526071f-989f-4c75-95f8-4a1d748ba6cc	create	1	\N	172.16.1.3/24	\N	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": null, "address": "172.16.1.3/24", "created": "2023-05-31", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2023-05-31T07:30:25.758Z", "custom_fields": {}, "assigned_object_id": null, "assigned_object_type": null}	49	\N	1
45	2023-05-31 09:36:18.2771+02	netbox	595936ad-024f-4e84-b921-ef87742b1315	create	2	\N	Server	\N	{"name": "Server", "slug": "server", "color": "9e9e9e", "created": "2023-05-31", "vm_role": true, "description": "", "last_updated": "2023-05-31T07:36:18.269Z", "custom_fields": {}}	23	\N	1
46	2023-05-31 09:37:40.101616+02	netbox	14f1af17-e7e5-4935-8c94-8301b413c72a	create	2	\N	Server BDD	\N	{"face": "", "name": "Server BDD", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2023-05-31", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2023-05-31T07:37:40.075Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	20	\N	1
47	2023-05-31 09:38:14.308411+02	netbox	f7a2358d-da57-40ef-8ec2-60595eec8b6f	create	3	\N	Switch	\N	{"name": "Switch", "slug": "switch", "color": "9e9e9e", "created": "2023-05-31", "vm_role": true, "description": "", "last_updated": "2023-05-31T07:38:14.294Z", "custom_fields": {}}	23	\N	1
48	2023-05-31 09:38:51.435438+02	netbox	6ab8a65b-5746-443a-b0c8-a29167b3eb34	create	3	\N	Switch PPC4	\N	{"face": "", "name": "Switch PPC4", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2023-05-31", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2023-05-31T07:38:51.422Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	20	\N	1
50	2023-05-31 10:41:23.664979+02	netbox	980ad5f3-a83d-4a02-b8a7-44da1562aa53	delete	4	\N	Base de donnée web	{"disk": null, "name": "Base de donnée web", "role": null, "tags": [], "vcpus": "2.00", "memory": 1024, "status": "active", "tenant": null, "cluster": 1, "created": "2023-05-31", "comments": "", "platform": null, "primary_ip4": null, "primary_ip6": null, "last_updated": "2023-05-31T07:40:01.604Z", "custom_fields": {}, "local_context_data": null}	\N	82	\N	1
52	2023-05-31 10:48:39.815999+02	netbox	bc5672c2-c9b3-49b0-b04a-5fdbdabbad31	delete	5	\N	VM db netbox	{"disk": null, "name": "VM db netbox", "role": null, "tags": [], "vcpus": null, "memory": null, "status": "active", "tenant": null, "cluster": 1, "created": "2023-05-31", "comments": "", "platform": null, "primary_ip4": null, "primary_ip6": null, "last_updated": "2023-05-31T08:48:28.014Z", "custom_fields": {}, "local_context_data": null}	\N	82	\N	1
55	2023-05-31 11:09:13.523954+02	netbox	75af3f91-f6ca-4514-aa56-862a1b551783	delete	7	\N	VM db web	{"disk": null, "name": "VM db web", "role": null, "tags": [], "vcpus": null, "memory": null, "status": "active", "tenant": null, "cluster": 1, "created": "2023-05-31", "comments": "", "platform": null, "primary_ip4": null, "primary_ip6": null, "last_updated": "2023-05-31T09:07:25.538Z", "custom_fields": {}, "local_context_data": null}	\N	82	\N	1
56	2023-05-31 11:12:32.245791+02	netbox	edf99f77-852b-4bf8-84ec-4056a31f26c7	create	4	\N	Cisco 2911 (4)	\N	{"face": "front", "name": null, "rack": 1, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "cluster": null, "created": "2023-05-31", "comments": "", "location": null, "platform": null, "position": 36, "asset_tag": null, "device_role": 1, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2023-05-31T09:12:32.227Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	20	\N	1
58	2023-05-31 11:50:56.020375+02	netbox	74750691-efa7-4880-a301-e657f8e2aaae	create	2	\N	Administration	\N	{"name": "Administration", "slug": "administration", "created": "2023-05-31", "description": "", "last_updated": "2023-05-31T09:50:56.014Z", "custom_fields": {}}	81	\N	1
59	2023-05-31 11:51:27.710393+02	netbox	42298ea3-0b15-4459-82d0-f27bf9742b3d	create	2	\N	Admin	\N	{"name": "Admin", "site": 1, "tags": [], "type": 2, "group": null, "tenant": null, "created": "2023-05-31", "comments": "", "last_updated": "2023-05-31T09:51:27.680Z", "custom_fields": {}}	79	\N	1
60	2023-05-31 13:24:56.914913+02	netbox	82cfb145-57e2-4f80-802c-3038c9ec9d4b	create	3	\N	Dmz	\N	{"name": "Dmz", "slug": "dmz", "created": "2023-05-31", "description": "", "last_updated": "2023-05-31T11:24:56.908Z", "custom_fields": {}}	81	\N	1
61	2023-05-31 13:25:12.040055+02	netbox	84f19db8-f781-48a3-af2e-b265879a23fd	create	3	\N	DMZ	\N	{"name": "DMZ", "site": 1, "tags": [], "type": 3, "group": null, "tenant": null, "created": "2023-05-31", "comments": "", "last_updated": "2023-05-31T11:25:12.023Z", "custom_fields": {}}	79	\N	1
62	2023-05-31 13:25:37.25058+02	netbox	cc6e588f-313d-4477-9a7a-28c0a9a2ed8b	create	4	\N	MANAGEMENT	\N	{"name": "MANAGEMENT", "slug": "management", "created": "2023-05-31", "description": "", "last_updated": "2023-05-31T11:25:37.230Z", "custom_fields": {}}	81	\N	1
63	2023-05-31 13:26:01.639393+02	netbox	95df32d3-3450-445b-bf74-48e17e64a762	create	4	\N	Management	\N	{"name": "Management", "site": 1, "tags": [], "type": 4, "group": null, "tenant": null, "created": "2023-05-31", "comments": "", "last_updated": "2023-05-31T11:26:01.622Z", "custom_fields": {}}	79	\N	1
64	2023-05-31 13:26:14.162053+02	netbox	94cae543-e9bb-49b0-bc48-cfa2280c2344	create	5	\N	WEB	\N	{"name": "WEB", "slug": "web", "created": "2023-05-31", "description": "", "last_updated": "2023-05-31T11:26:14.157Z", "custom_fields": {}}	81	\N	1
65	2023-05-31 13:26:31.690693+02	netbox	8ef00384-52d8-4b85-abad-aa7891fdf2e5	create	5	\N	Web	\N	{"name": "Web", "site": 1, "tags": [], "type": 5, "group": null, "tenant": null, "created": "2023-05-31", "comments": "", "last_updated": "2023-05-31T11:26:31.676Z", "custom_fields": {}}	79	\N	1
66	2023-05-31 13:39:58.541751+02	netbox	3e607f93-5f2a-4511-ba46-a0b8cdfb8f63	delete	6	\N	VM db netbox	{"disk": null, "name": "VM db netbox", "role": null, "tags": [], "vcpus": null, "memory": null, "status": "active", "tenant": null, "cluster": 1, "created": "2023-05-31", "comments": "", "platform": null, "primary_ip4": null, "primary_ip6": null, "last_updated": "2023-05-31T08:48:56.520Z", "custom_fields": {}, "local_context_data": null}	\N	82	\N	1
71	2023-05-31 13:43:13.857772+02	netbox	2a35c6b9-33e3-4fed-984c-7aa806fa5378	delete	3	\N	Base de donnée gitea	{"disk": null, "name": "Base de donnée gitea", "role": null, "tags": [], "vcpus": "2.00", "memory": 2046, "status": "active", "tenant": null, "cluster": 1, "created": "2023-05-31", "comments": "", "platform": null, "primary_ip4": null, "primary_ip6": null, "last_updated": "2023-05-31T07:29:04.506Z", "custom_fields": {}, "local_context_data": null}	\N	82	\N	1
72	2023-05-31 13:43:13.92435+02	netbox	2a35c6b9-33e3-4fed-984c-7aa806fa5378	delete	9	\N	VM db netbox	{"disk": null, "name": "VM db netbox", "role": null, "tags": [], "vcpus": null, "memory": null, "status": "active", "tenant": null, "cluster": 2, "created": "2023-05-31", "comments": "", "platform": null, "primary_ip4": null, "primary_ip6": null, "last_updated": "2023-05-31T11:41:50.056Z", "custom_fields": {}, "local_context_data": null}	\N	82	\N	1
73	2023-05-31 13:43:13.998112+02	netbox	2a35c6b9-33e3-4fed-984c-7aa806fa5378	delete	10	\N	VM db netbox	{"disk": null, "name": "VM db netbox", "role": null, "tags": [], "vcpus": null, "memory": null, "status": "active", "tenant": null, "cluster": 3, "created": "2023-05-31", "comments": "", "platform": null, "primary_ip4": null, "primary_ip6": null, "last_updated": "2023-05-31T11:42:20.421Z", "custom_fields": {}, "local_context_data": null}	\N	82	\N	1
74	2023-05-31 13:43:14.07132+02	netbox	2a35c6b9-33e3-4fed-984c-7aa806fa5378	delete	11	\N	VM db netbox	{"disk": null, "name": "VM db netbox", "role": null, "tags": [], "vcpus": null, "memory": null, "status": "active", "tenant": null, "cluster": 4, "created": "2023-05-31", "comments": "", "platform": null, "primary_ip4": null, "primary_ip6": null, "last_updated": "2023-05-31T11:42:40.095Z", "custom_fields": {}, "local_context_data": null}	\N	82	\N	1
75	2023-05-31 13:43:14.145944+02	netbox	2a35c6b9-33e3-4fed-984c-7aa806fa5378	delete	12	\N	VM db netbox	{"disk": null, "name": "VM db netbox", "role": null, "tags": [], "vcpus": null, "memory": null, "status": "active", "tenant": null, "cluster": 5, "created": "2023-05-31", "comments": "", "platform": null, "primary_ip4": null, "primary_ip6": null, "last_updated": "2023-05-31T11:42:56.451Z", "custom_fields": {}, "local_context_data": null}	\N	82	\N	1
76	2023-05-31 13:43:14.220272+02	netbox	2a35c6b9-33e3-4fed-984c-7aa806fa5378	delete	8	\N	VM-db-web	{"disk": null, "name": "VM-db-web", "role": null, "tags": [], "vcpus": null, "memory": null, "status": "active", "tenant": null, "cluster": 1, "created": "2023-05-31", "comments": "", "platform": null, "primary_ip4": null, "primary_ip6": null, "last_updated": "2023-05-31T09:16:10.988Z", "custom_fields": {}, "local_context_data": null}	\N	82	\N	1
\.


--
-- Data for Name: extras_tag; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_tag (name, slug, created, last_updated, id, color, description) FROM stdin;
\.


--
-- Data for Name: extras_taggeditem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_taggeditem (object_id, id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: extras_webhook; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_webhook (id, name, type_create, type_update, type_delete, payload_url, enabled, http_method, http_content_type, additional_headers, body_template, secret, ssl_verification, ca_file_path, created, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_webhook_content_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_webhook_content_types (id, webhook_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: ipam_aggregate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_aggregate (created, last_updated, custom_field_data, id, prefix, date_added, description, rir_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_ipaddress; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_ipaddress (created, last_updated, custom_field_data, id, address, status, role, assigned_object_id, dns_name, description, assigned_object_type_id, nat_inside_id, tenant_id, vrf_id) FROM stdin;
2023-05-31	2023-05-31 09:30:25.758799+02	{}	1	172.16.1.3/24	active		\N			\N	\N	\N	\N
\.


--
-- Data for Name: ipam_iprange; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_iprange (created, last_updated, custom_field_data, id, start_address, end_address, size, status, description, role_id, tenant_id, vrf_id) FROM stdin;
\.


--
-- Data for Name: ipam_prefix; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_prefix (created, last_updated, custom_field_data, id, prefix, status, is_pool, description, role_id, site_id, tenant_id, vlan_id, vrf_id, _children, _depth, mark_utilized) FROM stdin;
2023-05-30	2023-05-30 13:29:30.329285+02	{}	1	172.16.0.0/24	active	f		\N	1	\N	5	\N	0	0	f
2023-05-30	2023-05-30 13:30:24.004751+02	{}	2	172.16.1.0/24	active	f		\N	1	\N	4	\N	0	0	f
2023-05-30	2023-05-30 13:30:54.465433+02	{}	3	172.16.2.0/28	active	f		\N	1	\N	2	\N	0	0	f
2023-05-30	2023-05-30 13:31:52.260224+02	{}	4	172.16.2.16/28	active	f		\N	1	\N	1	\N	0	0	f
2023-05-30	2023-05-30 13:32:14.729657+02	{}	5	172.16.2.32/28	active	f		\N	1	\N	3	\N	0	0	f
\.


--
-- Data for Name: ipam_rir; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_rir (created, last_updated, custom_field_data, id, name, slug, is_private, description) FROM stdin;
\.


--
-- Data for Name: ipam_role; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_role (created, last_updated, custom_field_data, id, name, slug, weight, description) FROM stdin;
\.


--
-- Data for Name: ipam_routetarget; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_routetarget (created, last_updated, custom_field_data, id, name, description, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_service; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_service (created, last_updated, custom_field_data, id, name, protocol, ports, description, device_id, virtual_machine_id) FROM stdin;
\.


--
-- Data for Name: ipam_service_ipaddresses; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_service_ipaddresses (id, service_id, ipaddress_id) FROM stdin;
\.


--
-- Data for Name: ipam_vlan; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vlan (created, last_updated, custom_field_data, id, vid, name, status, description, group_id, role_id, site_id, tenant_id) FROM stdin;
2023-05-30	2023-05-30 13:22:41.111427+02	{}	1	1	DMZ	active		\N	\N	1	\N
2023-05-30	2023-05-30 13:22:41.175701+02	{}	2	2	ADMIN	active		\N	\N	1	\N
2023-05-30	2023-05-30 13:22:41.241136+02	{}	3	3	MANAGEMENT	active		\N	\N	1	\N
2023-05-30	2023-05-30 13:24:13.869534+02	{}	4	4	BDD	active		\N	\N	1	\N
2023-05-30	2023-05-30 13:24:13.931516+02	{}	5	5	WEB	active		\N	\N	1	\N
\.


--
-- Data for Name: ipam_vlangroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vlangroup (created, last_updated, custom_field_data, id, name, slug, scope_id, description, scope_type_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf (created, last_updated, custom_field_data, id, name, rd, enforce_unique, description, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf_export_targets; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf_export_targets (id, vrf_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf_import_targets; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf_import_targets (id, vrf_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: tenancy_tenant; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_tenant (created, last_updated, custom_field_data, id, name, slug, description, comments, group_id) FROM stdin;
\.


--
-- Data for Name: tenancy_tenantgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_tenantgroup (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission (id, name, description, enabled, actions, constraints) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_groups (id, objectpermission_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_object_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_object_types (id, objectpermission_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_users; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_users (id, objectpermission_id, user_id) FROM stdin;
\.


--
-- Data for Name: users_token; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_token (id, created, expires, key, write_enabled, description, user_id) FROM stdin;
1	2023-05-30 11:40:49.90845+02	2023-11-02 10:40:44+01	29042f325a3411e372c6f7ca5512e65ae4089592	t		1
\.


--
-- Data for Name: users_userconfig; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_userconfig (id, data, user_id) FROM stdin;
1	{}	1
\.


--
-- Data for Name: virtualization_cluster; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_cluster (created, last_updated, custom_field_data, id, name, comments, group_id, site_id, tenant_id, type_id) FROM stdin;
2023-05-30	2023-05-30 11:45:36.365046+02	{}	1	BDD		\N	1	\N	1
2023-05-31	2023-05-31 11:51:27.680967+02	{}	2	Admin		\N	1	\N	2
2023-05-31	2023-05-31 13:25:12.023781+02	{}	3	DMZ		\N	1	\N	3
2023-05-31	2023-05-31 13:26:01.622593+02	{}	4	Management		\N	1	\N	4
2023-05-31	2023-05-31 13:26:31.676429+02	{}	5	Web		\N	1	\N	5
\.


--
-- Data for Name: virtualization_clustergroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_clustergroup (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
\.


--
-- Data for Name: virtualization_clustertype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_clustertype (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
2023-05-30	2023-05-30 11:34:54.628857+02	{}	1	Base de donnée	base-de-donne	
2023-05-31	2023-05-31 11:50:56.014333+02	{}	2	Administration	administration	
2023-05-31	2023-05-31 13:24:56.908674+02	{}	3	Dmz	dmz	
2023-05-31	2023-05-31 13:25:37.230467+02	{}	4	MANAGEMENT	management	
2023-05-31	2023-05-31 13:26:14.157027+02	{}	5	WEB	web	
\.


--
-- Data for Name: virtualization_virtualmachine; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_virtualmachine (created, last_updated, custom_field_data, id, local_context_data, name, status, vcpus, memory, disk, comments, cluster_id, platform_id, primary_ip4_id, primary_ip6_id, role_id, tenant_id, _name) FROM stdin;
\.


--
-- Data for Name: virtualization_vminterface; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_vminterface (created, last_updated, custom_field_data, id, enabled, mac_address, mtu, mode, name, _name, description, parent_id, untagged_vlan_id, virtual_machine_id) FROM stdin;
\.


--
-- Data for Name: virtualization_vminterface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_vminterface_tagged_vlans (id, vminterface_id, vlan_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 332, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuit_id_seq', 1, false);


--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuittermination_id_seq', 1, false);


--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuittype_id_seq', 1, false);


--
-- Name: circuits_provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_provider_id_seq', 1, false);


--
-- Name: circuits_providernetwork_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_providernetwork_id_seq', 1, false);


--
-- Name: dcim_cable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_cable_id_seq', 1, false);


--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_cablepath_id_seq', 1, false);


--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleport_id_seq', 1, false);


--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleporttemplate_id_seq', 1, false);


--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleserverport_id_seq', 1, false);


--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleserverporttemplate_id_seq', 1, false);


--
-- Name: dcim_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_device_id_seq', 4, true);


--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicebay_id_seq', 1, false);


--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicebaytemplate_id_seq', 1, false);


--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicerole_id_seq', 3, true);


--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicetype_id_seq', 2, true);


--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_frontport_id_seq', 1, false);


--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_frontporttemplate_id_seq', 1, false);


--
-- Name: dcim_interface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_id_seq', 1, false);


--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_tagged_vlans_id_seq', 1, false);


--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interfacetemplate_id_seq', 1, false);


--
-- Name: dcim_inventoryitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_inventoryitem_id_seq', 1, false);


--
-- Name: dcim_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_location_id_seq', 1, false);


--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_manufacturer_id_seq', 2, true);


--
-- Name: dcim_platform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_platform_id_seq', 1, false);


--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerfeed_id_seq', 1, false);


--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_poweroutlet_id_seq', 1, false);


--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_poweroutlettemplate_id_seq', 1, false);


--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerpanel_id_seq', 1, false);


--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerport_id_seq', 1, false);


--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerporttemplate_id_seq', 1, false);


--
-- Name: dcim_rack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rack_id_seq', 1, true);


--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackreservation_id_seq', 1, false);


--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackrole_id_seq', 1, false);


--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rearport_id_seq', 1, false);


--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rearporttemplate_id_seq', 1, false);


--
-- Name: dcim_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_region_id_seq', 1, false);


--
-- Name: dcim_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_site_id_seq', 1, true);


--
-- Name: dcim_sitegroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_sitegroup_id_seq', 1, false);


--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_virtualchassis_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 2, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 83, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 353, true);


--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_cluster_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_clusters_id_seq', 1, false);


--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_device_types_id_seq', 1, false);


--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_id_seq', 1, false);


--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_platforms_id_seq', 1, false);


--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_regions_id_seq', 1, false);


--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_roles_id_seq', 1, false);


--
-- Name: extras_configcontext_site_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_site_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_sites_id_seq', 1, false);


--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tags_id_seq', 1, false);


--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tenant_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tenants_id_seq', 1, false);


--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfield_content_types_id_seq', 1, false);


--
-- Name: extras_customfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfield_id_seq', 1, false);


--
-- Name: extras_customlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customlink_id_seq', 1, false);


--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_exporttemplate_id_seq', 1, false);


--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_imageattachment_id_seq', 1, false);


--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_jobresult_id_seq', 1, false);


--
-- Name: extras_journalentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_journalentry_id_seq', 1, false);


--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_objectchange_id_seq', 76, true);


--
-- Name: extras_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_tag_id_seq', 1, false);


--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_taggeditem_id_seq', 1, false);


--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_webhook_content_types_id_seq', 1, false);


--
-- Name: extras_webhook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_webhook_id_seq', 1, false);


--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_aggregate_id_seq', 1, false);


--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_ipaddress_id_seq', 1, true);


--
-- Name: ipam_iprange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_iprange_id_seq', 1, true);


--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_prefix_id_seq', 5, true);


--
-- Name: ipam_rir_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_rir_id_seq', 1, false);


--
-- Name: ipam_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_role_id_seq', 1, false);


--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_routetarget_id_seq', 1, false);


--
-- Name: ipam_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_service_id_seq', 1, false);


--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_service_ipaddresses_id_seq', 1, false);


--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vlan_id_seq', 5, true);


--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vlangroup_id_seq', 1, true);


--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_export_targets_id_seq', 1, false);


--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_id_seq', 1, false);


--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_import_targets_id_seq', 1, false);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 1, false);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 1, false);


--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_tenant_id_seq', 1, false);


--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_tenantgroup_id_seq', 1, false);


--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_groups_id_seq', 1, false);


--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_id_seq', 1, false);


--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_object_types_id_seq', 1, false);


--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_users_id_seq', 1, false);


--
-- Name: users_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_token_id_seq', 1, true);


--
-- Name: users_userconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_userconfig_id_seq', 1, true);


--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_cluster_id_seq', 5, true);


--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_clustergroup_id_seq', 1, false);


--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_clustertype_id_seq', 5, true);


--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_virtualmachine_id_seq', 12, true);


--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_vminterface_id_seq', 1, false);


--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_vminterface_tagged_vlans_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: circuits_circuit circuits_circuit_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuit circuits_circuit_provider_id_cid_b6f29862_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_cid_b6f29862_uniq UNIQUE (provider_id, cid);


--
-- Name: circuits_circuittermination circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq UNIQUE (circuit_id, term_side);


--
-- Name: circuits_circuittermination circuits_circuittermination_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_name_key UNIQUE (name);


--
-- Name: circuits_circuittype circuits_circuittype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_slug_key UNIQUE (slug);


--
-- Name: circuits_provider circuits_provider_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_name_key UNIQUE (name);


--
-- Name: circuits_provider circuits_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_pkey PRIMARY KEY (id);


--
-- Name: circuits_provider circuits_provider_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_slug_key UNIQUE (slug);


--
-- Name: circuits_providernetwork circuits_providernetwork_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_pkey PRIMARY KEY (id);


--
-- Name: circuits_providernetwork circuits_providernetwork_provider_id_name_6f6610a0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_provider_id_name_6f6610a0_uniq UNIQUE (provider_id, name);


--
-- Name: circuits_providernetwork circuits_providernetwork_provider_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_provider_name UNIQUE (provider_id, name);


--
-- Name: dcim_cable dcim_cable_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_pkey PRIMARY KEY (id);


--
-- Name: dcim_cable dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq UNIQUE (termination_a_type_id, termination_a_id);


--
-- Name: dcim_cable dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq UNIQUE (termination_b_type_id, termination_b_id);


--
-- Name: dcim_cablepath dcim_cablepath_origin_type_id_origin_id_41b6f814_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_origin_type_id_origin_id_41b6f814_uniq UNIQUE (origin_type_id, origin_id);


--
-- Name: dcim_cablepath dcim_cablepath_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleport dcim_consoleport_device_id_name_293786b6_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_name_293786b6_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleport dcim_consoleport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_name_fb1c5999_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_name_fb1c5999_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverportte_device_type_id_name_a05c974d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverportte_device_type_id_name_a05c974d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_device dcim_device_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: dcim_device dcim_device_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: dcim_device dcim_device_rack_id_position_face_43208a79_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_position_face_43208a79_uniq UNIQUE (rack_id, "position", face);


--
-- Name: dcim_device dcim_device_site_id_tenant_id_name_93f4f962_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_site_id_tenant_id_name_93f4f962_uniq UNIQUE (site_id, tenant_id, name);


--
-- Name: dcim_device dcim_device_virtual_chassis_id_vc_position_efea7133_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_vc_position_efea7133_uniq UNIQUE (virtual_chassis_id, vc_position);


--
-- Name: dcim_devicebay dcim_devicebay_device_id_name_2475a67b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_name_2475a67b_uniq UNIQUE (device_id, name);


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_key UNIQUE (installed_device_id);


--
-- Name: dcim_devicebay dcim_devicebay_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_name_key UNIQUE (name);


--
-- Name: dcim_devicerole dcim_devicerole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_slug_key UNIQUE (slug);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_model_17948c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_model_17948c0c_uniq UNIQUE (manufacturer_id, model);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq UNIQUE (manufacturer_id, slug);


--
-- Name: dcim_devicetype dcim_devicetype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontport dcim_frontport_device_id_name_235b7af2_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_device_id_name_235b7af2_uniq UNIQUE (device_id, name);


--
-- Name: dcim_frontport dcim_frontport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontport dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_interface dcim_interface_device_id_name_bffc4ec4_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_name_bffc4ec4_uniq UNIQUE (device_id, name);


--
-- Name: dcim_interface dcim_interface_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_pkey PRIMARY KEY (id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq UNIQUE (interface_id, vlan_id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_device_type_id_name_3a847237_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_device_type_id_name_3a847237_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_device_id_parent_id_name_bb84bd2b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_device_id_parent_id_name_bb84bd2b_uniq UNIQUE (device_id, parent_id, name);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_pkey PRIMARY KEY (id);


--
-- Name: dcim_location dcim_location_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_pkey PRIMARY KEY (id);


--
-- Name: dcim_location dcim_location_site_id_name_b307d2e7_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_site_id_name_b307d2e7_uniq UNIQUE (site_id, name);


--
-- Name: dcim_location dcim_location_site_id_slug_08adceed_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_site_id_slug_08adceed_uniq UNIQUE (site_id, slug);


--
-- Name: dcim_manufacturer dcim_manufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_name_key UNIQUE (name);


--
-- Name: dcim_manufacturer dcim_manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_pkey PRIMARY KEY (id);


--
-- Name: dcim_manufacturer dcim_manufacturer_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_slug_key UNIQUE (slug);


--
-- Name: dcim_platform dcim_platform_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_name_key UNIQUE (name);


--
-- Name: dcim_platform dcim_platform_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_pkey PRIMARY KEY (id);


--
-- Name: dcim_platform dcim_platform_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_slug_key UNIQUE (slug);


--
-- Name: dcim_powerfeed dcim_powerfeed_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerfeed dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq UNIQUE (power_panel_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_name_981b00c1_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_name_981b00c1_uniq UNIQUE (device_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_pkey PRIMARY KEY (id);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerpanel dcim_powerpanel_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerpanel dcim_powerpanel_site_id_name_804df4c0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_site_id_name_804df4c0_uniq UNIQUE (site_id, name);


--
-- Name: dcim_powerport dcim_powerport_device_id_name_948af82c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_name_948af82c_uniq UNIQUE (device_id, name);


--
-- Name: dcim_powerport dcim_powerport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_rack dcim_rack_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_rack dcim_rack_location_id_facility_id_59f80bca_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_location_id_facility_id_59f80bca_uniq UNIQUE (location_id, facility_id);


--
-- Name: dcim_rack dcim_rack_location_id_name_283dd15d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_location_id_name_283dd15d_uniq UNIQUE (location_id, name);


--
-- Name: dcim_rack dcim_rack_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackreservation dcim_rackreservation_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_name_key UNIQUE (name);


--
-- Name: dcim_rackrole dcim_rackrole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_slug_key UNIQUE (slug);


--
-- Name: dcim_rearport dcim_rearport_device_id_name_4b14dde6_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_device_id_name_4b14dde6_uniq UNIQUE (device_id, name);


--
-- Name: dcim_rearport dcim_rearport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_pkey PRIMARY KEY (id);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_device_type_id_name_9bdddb29_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_device_type_id_name_9bdddb29_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_region dcim_region_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_name_key UNIQUE (name);


--
-- Name: dcim_region dcim_region_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_pkey PRIMARY KEY (id);


--
-- Name: dcim_region dcim_region_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_slug_key UNIQUE (slug);


--
-- Name: dcim_site dcim_site_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_name_key UNIQUE (name);


--
-- Name: dcim_site dcim_site_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_pkey PRIMARY KEY (id);


--
-- Name: dcim_site dcim_site_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_slug_key UNIQUE (slug);


--
-- Name: dcim_sitegroup dcim_sitegroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_name_key UNIQUE (name);


--
-- Name: dcim_sitegroup dcim_sitegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_pkey PRIMARY KEY (id);


--
-- Name: dcim_sitegroup dcim_sitegroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_slug_key UNIQUE (slug);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_key UNIQUE (master_id);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: extras_configcontext_clusters extras_configcontext_clu_configcontext_id_cluster_0c7e5d20_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_0c7e5d20_uniq UNIQUE (configcontext_id, cluster_id);


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_clu_configcontext_id_cluster_bc530192_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_bc530192_uniq UNIQUE (configcontext_id, clustergroup_id);


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_cluster_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_cluster_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_clusters extras_configcontext_clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_clusters_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_device_types extras_configcontext_dev_configcontext_id_devicet_a0aaba6f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_dev_configcontext_id_devicet_a0aaba6f_uniq UNIQUE (configcontext_id, devicetype_id);


--
-- Name: extras_configcontext_device_types extras_configcontext_device_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_device_types_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext extras_configcontext_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_name_key UNIQUE (name);


--
-- Name: extras_configcontext extras_configcontext_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_platforms extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq UNIQUE (configcontext_id, platform_id);


--
-- Name: extras_configcontext_platforms extras_configcontext_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platforms_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_regions extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq UNIQUE (configcontext_id, region_id);


--
-- Name: extras_configcontext_regions extras_configcontext_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_regions_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_roles extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq UNIQUE (configcontext_id, devicerole_id);


--
-- Name: extras_configcontext_roles extras_configcontext_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_roles_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_sites extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq UNIQUE (configcontext_id, site_id);


--
-- Name: extras_configcontext_site_groups extras_configcontext_sit_configcontext_id_sitegro_4caa52ec_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_sit_configcontext_id_sitegro_4caa52ec_uniq UNIQUE (configcontext_id, sitegroup_id);


--
-- Name: extras_configcontext_site_groups extras_configcontext_site_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_site_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_sites extras_configcontext_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tags extras_configcontext_tags_configcontext_id_tag_id_f6c53016_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_configcontext_id_tag_id_f6c53016_uniq UNIQUE (configcontext_id, tag_id);


--
-- Name: extras_configcontext_tags extras_configcontext_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq UNIQUE (configcontext_id, tenant_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq UNIQUE (configcontext_id, tenantgroup_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenant_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenant_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenants_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield_content_types extras_customfield_conte_customfield_id_contentty_51136c2b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_conte_customfield_id_contentty_51136c2b_uniq UNIQUE (customfield_id, contenttype_id);


--
-- Name: extras_customfield_content_types extras_customfield_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield extras_customfield_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_name_key UNIQUE (name);


--
-- Name: extras_customfield extras_customfield_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_pkey PRIMARY KEY (id);


--
-- Name: extras_customlink extras_customlink_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_name_key UNIQUE (name);


--
-- Name: extras_customlink extras_customlink_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_pkey PRIMARY KEY (id);


--
-- Name: extras_exporttemplate extras_exporttemplate_content_type_id_name_edca9b9b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_content_type_id_name_edca9b9b_uniq UNIQUE (content_type_id, name);


--
-- Name: extras_exporttemplate extras_exporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_pkey PRIMARY KEY (id);


--
-- Name: extras_imageattachment extras_imageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachment_pkey PRIMARY KEY (id);


--
-- Name: extras_jobresult extras_jobresult_job_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_job_id_key UNIQUE (job_id);


--
-- Name: extras_jobresult extras_jobresult_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_pkey PRIMARY KEY (id);


--
-- Name: extras_journalentry extras_journalentry_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry
    ADD CONSTRAINT extras_journalentry_pkey PRIMARY KEY (id);


--
-- Name: extras_objectchange extras_objectchange_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_pkey PRIMARY KEY (id);


--
-- Name: extras_tag extras_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_name_key UNIQUE (name);


--
-- Name: extras_tag extras_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_pkey PRIMARY KEY (id);


--
-- Name: extras_tag extras_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_slug_key UNIQUE (slug);


--
-- Name: extras_taggeditem extras_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook_content_types extras_webhook_content_t_webhook_id_contenttype_i_485b9e93_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_content_t_webhook_id_contenttype_i_485b9e93_uniq UNIQUE (webhook_id, contenttype_id);


--
-- Name: extras_webhook_content_types extras_webhook_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook extras_webhook_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_name_key UNIQUE (name);


--
-- Name: extras_webhook extras_webhook_payload_url_type_create__dd332134_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_payload_url_type_create__dd332134_uniq UNIQUE (payload_url, type_create, type_update, type_delete);


--
-- Name: extras_webhook extras_webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_pkey PRIMARY KEY (id);


--
-- Name: ipam_aggregate ipam_aggregate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_pkey PRIMARY KEY (id);


--
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_key UNIQUE (nat_inside_id);


--
-- Name: ipam_ipaddress ipam_ipaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_pkey PRIMARY KEY (id);


--
-- Name: ipam_iprange ipam_iprange_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_pkey PRIMARY KEY (id);


--
-- Name: ipam_prefix ipam_prefix_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_name_key UNIQUE (name);


--
-- Name: ipam_rir ipam_rir_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_slug_key UNIQUE (slug);


--
-- Name: ipam_role ipam_role_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_name_key UNIQUE (name);


--
-- Name: ipam_role ipam_role_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_pkey PRIMARY KEY (id);


--
-- Name: ipam_role ipam_role_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_slug_key UNIQUE (slug);


--
-- Name: ipam_routetarget ipam_routetarget_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_name_key UNIQUE (name);


--
-- Name: ipam_routetarget ipam_routetarget_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq UNIQUE (service_id, ipaddress_id);


--
-- Name: ipam_service ipam_service_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlan ipam_vlan_group_id_name_e53919df_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_name_e53919df_uniq UNIQUE (group_id, name);


--
-- Name: ipam_vlan ipam_vlan_group_id_vid_5ca4cc47_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_vid_5ca4cc47_uniq UNIQUE (group_id, vid);


--
-- Name: ipam_vlan ipam_vlan_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_scope_type_id_scope_id_name_66199b4b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_scope_type_id_scope_id_name_66199b4b_uniq UNIQUE (scope_type_id, scope_id, name);


--
-- Name: ipam_vlangroup ipam_vlangroup_scope_type_id_scope_id_slug_6ae7ef85_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_scope_type_id_scope_id_slug_6ae7ef85_uniq UNIQUE (scope_type_id, scope_id, slug);


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_vrf_id_routetarget_id_63ba8c62_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_vrf_id_routetarget_id_63ba8c62_uniq UNIQUE (vrf_id, routetarget_id);


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_vrf_id_routetarget_id_399b155f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_vrf_id_routetarget_id_399b155f_uniq UNIQUE (vrf_id, routetarget_id);


--
-- Name: ipam_vrf ipam_vrf_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf ipam_vrf_rd_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_rd_key UNIQUE (rd);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq UNIQUE (content_type_id, object_id, tag_id);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenant tenancy_tenant_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_name_key UNIQUE (name);


--
-- Name: tenancy_tenant tenancy_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenant tenancy_tenant_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_slug_key UNIQUE (slug);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_name_key UNIQUE (name);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_slug_key UNIQUE (slug);


--
-- Name: users_objectpermission_groups users_objectpermission_g_objectpermission_id_grou_3b62a39c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermission_g_objectpermission_id_grou_3b62a39c_uniq UNIQUE (objectpermission_id, group_id);


--
-- Name: users_objectpermission_groups users_objectpermission_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermission_groups_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission_object_types users_objectpermission_o_objectpermission_id_cont_7c40d31a_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermission_o_objectpermission_id_cont_7c40d31a_uniq UNIQUE (objectpermission_id, contenttype_id);


--
-- Name: users_objectpermission_object_types users_objectpermission_object_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermission_object_types_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission users_objectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission
    ADD CONSTRAINT users_objectpermission_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission_users users_objectpermission_u_objectpermission_id_user_3a7db108_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_u_objectpermission_id_user_3a7db108_uniq UNIQUE (objectpermission_id, user_id);


--
-- Name: users_objectpermission_users users_objectpermission_users_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_users_pkey PRIMARY KEY (id);


--
-- Name: users_token users_token_key_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_key_key UNIQUE (key);


--
-- Name: users_token users_token_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_pkey PRIMARY KEY (id);


--
-- Name: users_userconfig users_userconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_pkey PRIMARY KEY (id);


--
-- Name: users_userconfig users_userconfig_user_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_user_id_key UNIQUE (user_id);


--
-- Name: virtualization_cluster virtualization_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_name_key UNIQUE (name);


--
-- Name: virtualization_cluster virtualization_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_name_key UNIQUE (name);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_slug_key UNIQUE (slug);


--
-- Name: virtualization_clustertype virtualization_clustertype_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_name_key UNIQUE (name);


--
-- Name: virtualization_clustertype virtualization_clustertype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustertype virtualization_clustertype_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_slug_key UNIQUE (slug);


--
-- Name: virtualization_virtualmachine virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq UNIQUE (cluster_id, tenant_id, name);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_pkey PRIMARY KEY (id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: virtualization_vminterface virtualization_vminterfa_virtual_machine_id_name_cfb9c423_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterfa_virtual_machine_id_name_cfb9c423_uniq UNIQUE (virtual_machine_id, name);


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vminterfa_vminterface_id_vlan_id_27e907db_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vminterfa_vminterface_id_vlan_id_27e907db_uniq UNIQUE (vminterface_id, vlan_id);


--
-- Name: virtualization_vminterface virtualization_vminterface_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterface_pkey PRIMARY KEY (id);


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vminterface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vminterface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: circuits_circuit_provider_id_d9195418; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_provider_id_d9195418 ON public.circuits_circuit USING btree (provider_id);


--
-- Name: circuits_circuit_tenant_id_812508a5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_tenant_id_812508a5 ON public.circuits_circuit USING btree (tenant_id);


--
-- Name: circuits_circuit_termination_a_id_f891adac; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_termination_a_id_f891adac ON public.circuits_circuit USING btree (termination_a_id);


--
-- Name: circuits_circuit_termination_z_id_377b8551; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_termination_z_id_377b8551 ON public.circuits_circuit USING btree (termination_z_id);


--
-- Name: circuits_circuit_type_id_1b9f485a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_type_id_1b9f485a ON public.circuits_circuit USING btree (type_id);


--
-- Name: circuits_circuittermination__cable_peer_type_id_bd122156; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination__cable_peer_type_id_bd122156 ON public.circuits_circuittermination USING btree (_cable_peer_type_id);


--
-- Name: circuits_circuittermination_cable_id_35e9f703; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_cable_id_35e9f703 ON public.circuits_circuittermination USING btree (cable_id);


--
-- Name: circuits_circuittermination_circuit_id_257e87e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_circuit_id_257e87e7 ON public.circuits_circuittermination USING btree (circuit_id);


--
-- Name: circuits_circuittermination_provider_network_id_b0c660f1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_provider_network_id_b0c660f1 ON public.circuits_circuittermination USING btree (provider_network_id);


--
-- Name: circuits_circuittermination_site_id_e6fe5652; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_site_id_e6fe5652 ON public.circuits_circuittermination USING btree (site_id);


--
-- Name: circuits_circuittype_name_8256ea9a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittype_name_8256ea9a_like ON public.circuits_circuittype USING btree (name varchar_pattern_ops);


--
-- Name: circuits_circuittype_slug_9b4b3cf9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittype_slug_9b4b3cf9_like ON public.circuits_circuittype USING btree (slug varchar_pattern_ops);


--
-- Name: circuits_provider_name_8f2514f5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_name_8f2514f5_like ON public.circuits_provider USING btree (name varchar_pattern_ops);


--
-- Name: circuits_provider_slug_c3c0aa10_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_slug_c3c0aa10_like ON public.circuits_provider USING btree (slug varchar_pattern_ops);


--
-- Name: circuits_providernetwork_provider_id_7992236c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_providernetwork_provider_id_7992236c ON public.circuits_providernetwork USING btree (provider_id);


--
-- Name: dcim_cable__termination_a_device_id_e59cde1c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable__termination_a_device_id_e59cde1c ON public.dcim_cable USING btree (_termination_a_device_id);


--
-- Name: dcim_cable__termination_b_device_id_a9073762; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable__termination_b_device_id_a9073762 ON public.dcim_cable USING btree (_termination_b_device_id);


--
-- Name: dcim_cable_termination_a_type_id_a614bab8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable_termination_a_type_id_a614bab8 ON public.dcim_cable USING btree (termination_a_type_id);


--
-- Name: dcim_cable_termination_b_type_id_a91595d0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable_termination_b_type_id_a91595d0 ON public.dcim_cable USING btree (termination_b_type_id);


--
-- Name: dcim_cablepath_destination_type_id_a8c1654b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cablepath_destination_type_id_a8c1654b ON public.dcim_cablepath USING btree (destination_type_id);


--
-- Name: dcim_cablepath_origin_type_id_6de54f6d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cablepath_origin_type_id_6de54f6d ON public.dcim_cablepath USING btree (origin_type_id);


--
-- Name: dcim_consoleport__cable_peer_type_id_52adb1be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport__cable_peer_type_id_52adb1be ON public.dcim_consoleport USING btree (_cable_peer_type_id);


--
-- Name: dcim_consoleport__path_id_e40a4436; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport__path_id_e40a4436 ON public.dcim_consoleport USING btree (_path_id);


--
-- Name: dcim_consoleport_cable_id_a9ae5465; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_cable_id_a9ae5465 ON public.dcim_consoleport USING btree (cable_id);


--
-- Name: dcim_consoleport_device_id_f2d90d3c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_device_id_f2d90d3c ON public.dcim_consoleport USING btree (device_id);


--
-- Name: dcim_consoleporttemplate_device_type_id_075d4015; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleporttemplate_device_type_id_075d4015 ON public.dcim_consoleporttemplate USING btree (device_type_id);


--
-- Name: dcim_consoleserverport__cable_peer_type_id_132b6744; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport__cable_peer_type_id_132b6744 ON public.dcim_consoleserverport USING btree (_cable_peer_type_id);


--
-- Name: dcim_consoleserverport__path_id_dc5abe09; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport__path_id_dc5abe09 ON public.dcim_consoleserverport USING btree (_path_id);


--
-- Name: dcim_consoleserverport_cable_id_f2940dfd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_cable_id_f2940dfd ON public.dcim_consoleserverport USING btree (cable_id);


--
-- Name: dcim_consoleserverport_device_id_d9866581; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_device_id_d9866581 ON public.dcim_consoleserverport USING btree (device_id);


--
-- Name: dcim_consoleserverporttemplate_device_type_id_579bdc86; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverporttemplate_device_type_id_579bdc86 ON public.dcim_consoleserverporttemplate USING btree (device_type_id);


--
-- Name: dcim_device_asset_tag_8dac1079_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_asset_tag_8dac1079_like ON public.dcim_device USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_device_cluster_id_cf852f78; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_cluster_id_cf852f78 ON public.dcim_device USING btree (cluster_id);


--
-- Name: dcim_device_device_role_id_682e8188; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_device_role_id_682e8188 ON public.dcim_device USING btree (device_role_id);


--
-- Name: dcim_device_device_type_id_d61b4086; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_device_type_id_d61b4086 ON public.dcim_device USING btree (device_type_id);


--
-- Name: dcim_device_location_id_11a7bedb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_location_id_11a7bedb ON public.dcim_device USING btree (location_id);


--
-- Name: dcim_device_platform_id_468138f1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_platform_id_468138f1 ON public.dcim_device USING btree (platform_id);


--
-- Name: dcim_device_rack_id_23bde71f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_rack_id_23bde71f ON public.dcim_device USING btree (rack_id);


--
-- Name: dcim_device_site_id_ff897cf6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_site_id_ff897cf6 ON public.dcim_device USING btree (site_id);


--
-- Name: dcim_device_tenant_id_dcea7969; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_tenant_id_dcea7969 ON public.dcim_device USING btree (tenant_id);


--
-- Name: dcim_device_virtual_chassis_id_aed51693; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_virtual_chassis_id_aed51693 ON public.dcim_device USING btree (virtual_chassis_id);


--
-- Name: dcim_devicebay_device_id_0c8a1218; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicebay_device_id_0c8a1218 ON public.dcim_devicebay USING btree (device_id);


--
-- Name: dcim_devicebaytemplate_device_type_id_f4b24a29; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicebaytemplate_device_type_id_f4b24a29 ON public.dcim_devicebaytemplate USING btree (device_type_id);


--
-- Name: dcim_devicerole_name_1c813306_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicerole_name_1c813306_like ON public.dcim_devicerole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_devicerole_slug_7952643b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicerole_slug_7952643b_like ON public.dcim_devicerole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_devicetype_manufacturer_id_a3e8029e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_manufacturer_id_a3e8029e ON public.dcim_devicetype USING btree (manufacturer_id);


--
-- Name: dcim_devicetype_slug_448745bd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_slug_448745bd ON public.dcim_devicetype USING btree (slug);


--
-- Name: dcim_devicetype_slug_448745bd_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_slug_448745bd_like ON public.dcim_devicetype USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_frontport__cable_peer_type_id_c4690f56; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport__cable_peer_type_id_c4690f56 ON public.dcim_frontport USING btree (_cable_peer_type_id);


--
-- Name: dcim_frontport_cable_id_04ff8aab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_cable_id_04ff8aab ON public.dcim_frontport USING btree (cable_id);


--
-- Name: dcim_frontport_device_id_950557b5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_device_id_950557b5 ON public.dcim_frontport USING btree (device_id);


--
-- Name: dcim_frontport_rear_port_id_78df2532; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_rear_port_id_78df2532 ON public.dcim_frontport USING btree (rear_port_id);


--
-- Name: dcim_frontporttemplate_device_type_id_f088b952; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontporttemplate_device_type_id_f088b952 ON public.dcim_frontporttemplate USING btree (device_type_id);


--
-- Name: dcim_frontporttemplate_rear_port_id_9775411b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontporttemplate_rear_port_id_9775411b ON public.dcim_frontporttemplate USING btree (rear_port_id);


--
-- Name: dcim_interface__cable_peer_type_id_ce52cb81; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface__cable_peer_type_id_ce52cb81 ON public.dcim_interface USING btree (_cable_peer_type_id);


--
-- Name: dcim_interface__path_id_f8f4f7f0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface__path_id_f8f4f7f0 ON public.dcim_interface USING btree (_path_id);


--
-- Name: dcim_interface_cable_id_1b264edb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_cable_id_1b264edb ON public.dcim_interface USING btree (cable_id);


--
-- Name: dcim_interface_device_id_359c6115; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_device_id_359c6115 ON public.dcim_interface USING btree (device_id);


--
-- Name: dcim_interface_lag_id_ea1a1d12; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_lag_id_ea1a1d12 ON public.dcim_interface USING btree (lag_id);


--
-- Name: dcim_interface_parent_id_3e2b159b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_parent_id_3e2b159b ON public.dcim_interface USING btree (parent_id);


--
-- Name: dcim_interface_tagged_vlans_interface_id_5870c9e9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_tagged_vlans_interface_id_5870c9e9 ON public.dcim_interface_tagged_vlans USING btree (interface_id);


--
-- Name: dcim_interface_tagged_vlans_vlan_id_e027005c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_tagged_vlans_vlan_id_e027005c ON public.dcim_interface_tagged_vlans USING btree (vlan_id);


--
-- Name: dcim_interface_untagged_vlan_id_838dc7be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_untagged_vlan_id_838dc7be ON public.dcim_interface USING btree (untagged_vlan_id);


--
-- Name: dcim_interfacetemplate_device_type_id_4bfcbfab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interfacetemplate_device_type_id_4bfcbfab ON public.dcim_interfacetemplate USING btree (device_type_id);


--
-- Name: dcim_inventoryitem_asset_tag_d3289273_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_asset_tag_d3289273_like ON public.dcim_inventoryitem USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_inventoryitem_device_id_033d83f8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_device_id_033d83f8 ON public.dcim_inventoryitem USING btree (device_id);


--
-- Name: dcim_inventoryitem_manufacturer_id_dcd1b78a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_manufacturer_id_dcd1b78a ON public.dcim_inventoryitem USING btree (manufacturer_id);


--
-- Name: dcim_inventoryitem_parent_id_7ebcd457; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_parent_id_7ebcd457 ON public.dcim_inventoryitem USING btree (parent_id);


--
-- Name: dcim_inventoryitem_tree_id_4676ade2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_tree_id_4676ade2 ON public.dcim_inventoryitem USING btree (tree_id);


--
-- Name: dcim_location_parent_id_d77f3318; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_parent_id_d77f3318 ON public.dcim_location USING btree (parent_id);


--
-- Name: dcim_location_site_id_b55e975f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_site_id_b55e975f ON public.dcim_location USING btree (site_id);


--
-- Name: dcim_location_slug_352c5472; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_slug_352c5472 ON public.dcim_location USING btree (slug);


--
-- Name: dcim_location_slug_352c5472_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_slug_352c5472_like ON public.dcim_location USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_location_tree_id_5089ef14; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_tree_id_5089ef14 ON public.dcim_location USING btree (tree_id);


--
-- Name: dcim_manufacturer_name_841fcd92_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_manufacturer_name_841fcd92_like ON public.dcim_manufacturer USING btree (name varchar_pattern_ops);


--
-- Name: dcim_manufacturer_slug_00430749_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_manufacturer_slug_00430749_like ON public.dcim_manufacturer USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_platform_manufacturer_id_83f72d3d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_manufacturer_id_83f72d3d ON public.dcim_platform USING btree (manufacturer_id);


--
-- Name: dcim_platform_name_c2f04255_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_name_c2f04255_like ON public.dcim_platform USING btree (name varchar_pattern_ops);


--
-- Name: dcim_platform_slug_b0908ae4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_slug_b0908ae4_like ON public.dcim_platform USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_powerfeed__cable_peer_type_id_9f930589; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed__cable_peer_type_id_9f930589 ON public.dcim_powerfeed USING btree (_cable_peer_type_id);


--
-- Name: dcim_powerfeed__path_id_a1ea1f28; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed__path_id_a1ea1f28 ON public.dcim_powerfeed USING btree (_path_id);


--
-- Name: dcim_powerfeed_cable_id_ec44c4f8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_cable_id_ec44c4f8 ON public.dcim_powerfeed USING btree (cable_id);


--
-- Name: dcim_powerfeed_power_panel_id_32bde3be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_power_panel_id_32bde3be ON public.dcim_powerfeed USING btree (power_panel_id);


--
-- Name: dcim_powerfeed_rack_id_7abba090; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_rack_id_7abba090 ON public.dcim_powerfeed USING btree (rack_id);


--
-- Name: dcim_poweroutlet__cable_peer_type_id_bbff28d0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet__cable_peer_type_id_bbff28d0 ON public.dcim_poweroutlet USING btree (_cable_peer_type_id);


--
-- Name: dcim_poweroutlet__path_id_cbb47bb9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet__path_id_cbb47bb9 ON public.dcim_poweroutlet USING btree (_path_id);


--
-- Name: dcim_poweroutlet_cable_id_8dbea1ec; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_cable_id_8dbea1ec ON public.dcim_poweroutlet USING btree (cable_id);


--
-- Name: dcim_poweroutlet_device_id_286351d7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_device_id_286351d7 ON public.dcim_poweroutlet USING btree (device_id);


--
-- Name: dcim_poweroutlet_power_port_id_9bdf4163; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_power_port_id_9bdf4163 ON public.dcim_poweroutlet USING btree (power_port_id);


--
-- Name: dcim_poweroutlettemplate_device_type_id_26b2316c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_device_type_id_26b2316c ON public.dcim_poweroutlettemplate USING btree (device_type_id);


--
-- Name: dcim_poweroutlettemplate_power_port_id_c0fb0c42; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_power_port_id_c0fb0c42 ON public.dcim_poweroutlettemplate USING btree (power_port_id);


--
-- Name: dcim_powerpanel_location_id_474b60f8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerpanel_location_id_474b60f8 ON public.dcim_powerpanel USING btree (location_id);


--
-- Name: dcim_powerpanel_site_id_c430bc89; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerpanel_site_id_c430bc89 ON public.dcim_powerpanel USING btree (site_id);


--
-- Name: dcim_powerport__cable_peer_type_id_9df2a278; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport__cable_peer_type_id_9df2a278 ON public.dcim_powerport USING btree (_cable_peer_type_id);


--
-- Name: dcim_powerport__path_id_9fe4af8f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport__path_id_9fe4af8f ON public.dcim_powerport USING btree (_path_id);


--
-- Name: dcim_powerport_cable_id_c9682ba2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_cable_id_c9682ba2 ON public.dcim_powerport USING btree (cable_id);


--
-- Name: dcim_powerport_device_id_ef7185ae; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_device_id_ef7185ae ON public.dcim_powerport USING btree (device_id);


--
-- Name: dcim_powerporttemplate_device_type_id_1ddfbfcc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerporttemplate_device_type_id_1ddfbfcc ON public.dcim_powerporttemplate USING btree (device_type_id);


--
-- Name: dcim_rack_asset_tag_f88408e5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_asset_tag_f88408e5_like ON public.dcim_rack USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_rack_location_id_5f63ec31; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_location_id_5f63ec31 ON public.dcim_rack USING btree (location_id);


--
-- Name: dcim_rack_role_id_62d6919e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_role_id_62d6919e ON public.dcim_rack USING btree (role_id);


--
-- Name: dcim_rack_site_id_403c7b3a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_site_id_403c7b3a ON public.dcim_rack USING btree (site_id);


--
-- Name: dcim_rack_tenant_id_7cdf3725; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_tenant_id_7cdf3725 ON public.dcim_rack USING btree (tenant_id);


--
-- Name: dcim_rackreservation_rack_id_1ebbaa9b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_rack_id_1ebbaa9b ON public.dcim_rackreservation USING btree (rack_id);


--
-- Name: dcim_rackreservation_tenant_id_eb5e045f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_tenant_id_eb5e045f ON public.dcim_rackreservation USING btree (tenant_id);


--
-- Name: dcim_rackreservation_user_id_0785a527; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_user_id_0785a527 ON public.dcim_rackreservation USING btree (user_id);


--
-- Name: dcim_rackrole_name_9077cfcc_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackrole_name_9077cfcc_like ON public.dcim_rackrole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_rackrole_slug_40bbcd3a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackrole_slug_40bbcd3a_like ON public.dcim_rackrole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_rearport__cable_peer_type_id_cecf241c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport__cable_peer_type_id_cecf241c ON public.dcim_rearport USING btree (_cable_peer_type_id);


--
-- Name: dcim_rearport_cable_id_42c0e4e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport_cable_id_42c0e4e7 ON public.dcim_rearport USING btree (cable_id);


--
-- Name: dcim_rearport_device_id_0bdfe9c0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport_device_id_0bdfe9c0 ON public.dcim_rearport USING btree (device_id);


--
-- Name: dcim_rearporttemplate_device_type_id_6a02fd01; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearporttemplate_device_type_id_6a02fd01 ON public.dcim_rearporttemplate USING btree (device_type_id);


--
-- Name: dcim_region_name_ba5a7082_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_name_ba5a7082_like ON public.dcim_region USING btree (name varchar_pattern_ops);


--
-- Name: dcim_region_parent_id_2486f5d4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_parent_id_2486f5d4 ON public.dcim_region USING btree (parent_id);


--
-- Name: dcim_region_slug_ff078a66_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_slug_ff078a66_like ON public.dcim_region USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_region_tree_id_a09ea9a7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_tree_id_a09ea9a7 ON public.dcim_region USING btree (tree_id);


--
-- Name: dcim_site_group_id_3910c975; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_group_id_3910c975 ON public.dcim_site USING btree (group_id);


--
-- Name: dcim_site_name_8fe66c76_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_name_8fe66c76_like ON public.dcim_site USING btree (name varchar_pattern_ops);


--
-- Name: dcim_site_region_id_45210932; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_region_id_45210932 ON public.dcim_site USING btree (region_id);


--
-- Name: dcim_site_slug_4412c762_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_slug_4412c762_like ON public.dcim_site USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_site_tenant_id_15e7df63; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_tenant_id_15e7df63 ON public.dcim_site USING btree (tenant_id);


--
-- Name: dcim_sitegroup_name_803063c0_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_name_803063c0_like ON public.dcim_sitegroup USING btree (name varchar_pattern_ops);


--
-- Name: dcim_sitegroup_parent_id_533a5e44; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_parent_id_533a5e44 ON public.dcim_sitegroup USING btree (parent_id);


--
-- Name: dcim_sitegroup_slug_a11d2b04_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_slug_a11d2b04_like ON public.dcim_sitegroup USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_sitegroup_tree_id_e76dc999; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_tree_id_e76dc999 ON public.dcim_sitegroup USING btree (tree_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: extras_configcontext_cluster_groups_clustergroup_id_f4322ce8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_groups_clustergroup_id_f4322ce8 ON public.extras_configcontext_cluster_groups USING btree (clustergroup_id);


--
-- Name: extras_configcontext_cluster_groups_configcontext_id_8f50b794; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_groups_configcontext_id_8f50b794 ON public.extras_configcontext_cluster_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_clusters_cluster_id_6abd47a1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_clusters_cluster_id_6abd47a1 ON public.extras_configcontext_clusters USING btree (cluster_id);


--
-- Name: extras_configcontext_clusters_configcontext_id_ed579a40; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_clusters_configcontext_id_ed579a40 ON public.extras_configcontext_clusters USING btree (configcontext_id);


--
-- Name: extras_configcontext_device_types_configcontext_id_55632923; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_device_types_configcontext_id_55632923 ON public.extras_configcontext_device_types USING btree (configcontext_id);


--
-- Name: extras_configcontext_device_types_devicetype_id_b8788c2d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_device_types_devicetype_id_b8788c2d ON public.extras_configcontext_device_types USING btree (devicetype_id);


--
-- Name: extras_configcontext_name_4bbfe25d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_name_4bbfe25d_like ON public.extras_configcontext USING btree (name varchar_pattern_ops);


--
-- Name: extras_configcontext_platforms_configcontext_id_2a516699; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_platforms_configcontext_id_2a516699 ON public.extras_configcontext_platforms USING btree (configcontext_id);


--
-- Name: extras_configcontext_platforms_platform_id_3fdfedc0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_platforms_platform_id_3fdfedc0 ON public.extras_configcontext_platforms USING btree (platform_id);


--
-- Name: extras_configcontext_regions_configcontext_id_73003dbc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_regions_configcontext_id_73003dbc ON public.extras_configcontext_regions USING btree (configcontext_id);


--
-- Name: extras_configcontext_regions_region_id_35c6ba9d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_regions_region_id_35c6ba9d ON public.extras_configcontext_regions USING btree (region_id);


--
-- Name: extras_configcontext_roles_configcontext_id_59b67386; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_roles_configcontext_id_59b67386 ON public.extras_configcontext_roles USING btree (configcontext_id);


--
-- Name: extras_configcontext_roles_devicerole_id_d3a84813; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_roles_devicerole_id_d3a84813 ON public.extras_configcontext_roles USING btree (devicerole_id);


--
-- Name: extras_configcontext_site_groups_configcontext_id_2e0f43cb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_site_groups_configcontext_id_2e0f43cb ON public.extras_configcontext_site_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_site_groups_sitegroup_id_3287c9e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_site_groups_sitegroup_id_3287c9e7 ON public.extras_configcontext_site_groups USING btree (sitegroup_id);


--
-- Name: extras_configcontext_sites_configcontext_id_8c54feb9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_sites_configcontext_id_8c54feb9 ON public.extras_configcontext_sites USING btree (configcontext_id);


--
-- Name: extras_configcontext_sites_site_id_cbb76c96; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_sites_site_id_cbb76c96 ON public.extras_configcontext_sites USING btree (site_id);


--
-- Name: extras_configcontext_tags_configcontext_id_64a392b1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tags_configcontext_id_64a392b1 ON public.extras_configcontext_tags USING btree (configcontext_id);


--
-- Name: extras_configcontext_tags_tag_id_129a5d87; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tags_tag_id_129a5d87 ON public.extras_configcontext_tags USING btree (tag_id);


--
-- Name: extras_configcontext_tenant_groups_configcontext_id_92f68345; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenant_groups_configcontext_id_92f68345 ON public.extras_configcontext_tenant_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenant_groups_tenantgroup_id_0909688d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenant_groups_tenantgroup_id_0909688d ON public.extras_configcontext_tenant_groups USING btree (tenantgroup_id);


--
-- Name: extras_configcontext_tenants_configcontext_id_b53552a6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenants_configcontext_id_b53552a6 ON public.extras_configcontext_tenants USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenants_tenant_id_8d0aa28e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenants_tenant_id_8d0aa28e ON public.extras_configcontext_tenants USING btree (tenant_id);


--
-- Name: extras_customfield_content_types_contenttype_id_2997ba90; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_content_types_contenttype_id_2997ba90 ON public.extras_customfield_content_types USING btree (contenttype_id);


--
-- Name: extras_customfield_content_types_customfield_id_3842aaf3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_content_types_customfield_id_3842aaf3 ON public.extras_customfield_content_types USING btree (customfield_id);


--
-- Name: extras_customfield_name_2fe72707_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_name_2fe72707_like ON public.extras_customfield USING btree (name varchar_pattern_ops);


--
-- Name: extras_customlink_content_type_id_4d35b063; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customlink_content_type_id_4d35b063 ON public.extras_customlink USING btree (content_type_id);


--
-- Name: extras_customlink_name_daed2d18_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customlink_name_daed2d18_like ON public.extras_customlink USING btree (name varchar_pattern_ops);


--
-- Name: extras_exporttemplate_content_type_id_59737e21; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_exporttemplate_content_type_id_59737e21 ON public.extras_exporttemplate USING btree (content_type_id);


--
-- Name: extras_imageattachment_content_type_id_90e0643d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_imageattachment_content_type_id_90e0643d ON public.extras_imageattachment USING btree (content_type_id);


--
-- Name: extras_jobresult_obj_type_id_475e80aa; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_jobresult_obj_type_id_475e80aa ON public.extras_jobresult USING btree (obj_type_id);


--
-- Name: extras_jobresult_user_id_d35285ab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_jobresult_user_id_d35285ab ON public.extras_jobresult USING btree (user_id);


--
-- Name: extras_journalentry_assigned_object_type_id_1bba9f68; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_journalentry_assigned_object_type_id_1bba9f68 ON public.extras_journalentry USING btree (assigned_object_type_id);


--
-- Name: extras_journalentry_created_by_id_8d4e4329; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_journalentry_created_by_id_8d4e4329 ON public.extras_journalentry USING btree (created_by_id);


--
-- Name: extras_objectchange_changed_object_type_id_b755bb60; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_changed_object_type_id_b755bb60 ON public.extras_objectchange USING btree (changed_object_type_id);


--
-- Name: extras_objectchange_related_object_type_id_fe6e521f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_related_object_type_id_fe6e521f ON public.extras_objectchange USING btree (related_object_type_id);


--
-- Name: extras_objectchange_time_224380ea; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_time_224380ea ON public.extras_objectchange USING btree ("time");


--
-- Name: extras_objectchange_user_id_7fdf8186; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_user_id_7fdf8186 ON public.extras_objectchange USING btree (user_id);


--
-- Name: extras_tag_name_9550b3d9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_tag_name_9550b3d9_like ON public.extras_tag USING btree (name varchar_pattern_ops);


--
-- Name: extras_tag_slug_aaa5b7e9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_tag_slug_aaa5b7e9_like ON public.extras_tag USING btree (slug varchar_pattern_ops);


--
-- Name: extras_taggeditem_content_type_id_ba5562ed; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_content_type_id_ba5562ed ON public.extras_taggeditem USING btree (content_type_id);


--
-- Name: extras_taggeditem_content_type_id_object_id_80e28e23_idx; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_content_type_id_object_id_80e28e23_idx ON public.extras_taggeditem USING btree (content_type_id, object_id);


--
-- Name: extras_taggeditem_object_id_31b2aa77; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_object_id_31b2aa77 ON public.extras_taggeditem USING btree (object_id);


--
-- Name: extras_taggeditem_tag_id_d48af7c7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_tag_id_d48af7c7 ON public.extras_taggeditem USING btree (tag_id);


--
-- Name: extras_webhook_content_types_contenttype_id_3fc2c4d3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_content_types_contenttype_id_3fc2c4d3 ON public.extras_webhook_content_types USING btree (contenttype_id);


--
-- Name: extras_webhook_content_types_webhook_id_0c169800; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_content_types_webhook_id_0c169800 ON public.extras_webhook_content_types USING btree (webhook_id);


--
-- Name: extras_webhook_name_82cf60b5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_name_82cf60b5_like ON public.extras_webhook USING btree (name varchar_pattern_ops);


--
-- Name: ipam_aggregate_rir_id_ef7a27bd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_aggregate_rir_id_ef7a27bd ON public.ipam_aggregate USING btree (rir_id);


--
-- Name: ipam_aggregate_tenant_id_637dd1a1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_aggregate_tenant_id_637dd1a1 ON public.ipam_aggregate USING btree (tenant_id);


--
-- Name: ipam_ipaddress_assigned_object_type_id_02354370; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_assigned_object_type_id_02354370 ON public.ipam_ipaddress USING btree (assigned_object_type_id);


--
-- Name: ipam_ipaddress_tenant_id_ac55acfd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_tenant_id_ac55acfd ON public.ipam_ipaddress USING btree (tenant_id);


--
-- Name: ipam_ipaddress_vrf_id_51fcc59b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_vrf_id_51fcc59b ON public.ipam_ipaddress USING btree (vrf_id);


--
-- Name: ipam_iprange_role_id_2782e864; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_iprange_role_id_2782e864 ON public.ipam_iprange USING btree (role_id);


--
-- Name: ipam_iprange_tenant_id_856027ea; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_iprange_tenant_id_856027ea ON public.ipam_iprange USING btree (tenant_id);


--
-- Name: ipam_iprange_vrf_id_613e9dd2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_iprange_vrf_id_613e9dd2 ON public.ipam_iprange USING btree (vrf_id);


--
-- Name: ipam_prefix_role_id_0a98d415; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_role_id_0a98d415 ON public.ipam_prefix USING btree (role_id);


--
-- Name: ipam_prefix_site_id_0b20df05; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_site_id_0b20df05 ON public.ipam_prefix USING btree (site_id);


--
-- Name: ipam_prefix_tenant_id_7ba1fcc4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_tenant_id_7ba1fcc4 ON public.ipam_prefix USING btree (tenant_id);


--
-- Name: ipam_prefix_vlan_id_1db91bff; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_vlan_id_1db91bff ON public.ipam_prefix USING btree (vlan_id);


--
-- Name: ipam_prefix_vrf_id_34f78ed0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_vrf_id_34f78ed0 ON public.ipam_prefix USING btree (vrf_id);


--
-- Name: ipam_rir_name_64a71982_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_rir_name_64a71982_like ON public.ipam_rir USING btree (name varchar_pattern_ops);


--
-- Name: ipam_rir_slug_ff1a369a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_rir_slug_ff1a369a_like ON public.ipam_rir USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_role_name_13784849_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_role_name_13784849_like ON public.ipam_role USING btree (name varchar_pattern_ops);


--
-- Name: ipam_role_slug_309ca14c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_role_slug_309ca14c_like ON public.ipam_role USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_routetarget_name_212be79f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_routetarget_name_212be79f_like ON public.ipam_routetarget USING btree (name varchar_pattern_ops);


--
-- Name: ipam_routetarget_tenant_id_5a0b35e8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_routetarget_tenant_id_5a0b35e8 ON public.ipam_routetarget USING btree (tenant_id);


--
-- Name: ipam_service_device_id_b4d2bb9c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_device_id_b4d2bb9c ON public.ipam_service USING btree (device_id);


--
-- Name: ipam_service_ipaddresses_ipaddress_id_b4138c6d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_ipaddresses_ipaddress_id_b4138c6d ON public.ipam_service_ipaddresses USING btree (ipaddress_id);


--
-- Name: ipam_service_ipaddresses_service_id_ae26b9ab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_ipaddresses_service_id_ae26b9ab ON public.ipam_service_ipaddresses USING btree (service_id);


--
-- Name: ipam_service_virtual_machine_id_e8b53562; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_virtual_machine_id_e8b53562 ON public.ipam_service USING btree (virtual_machine_id);


--
-- Name: ipam_vlan_group_id_88cbfa62; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_group_id_88cbfa62 ON public.ipam_vlan USING btree (group_id);


--
-- Name: ipam_vlan_role_id_f5015962; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_role_id_f5015962 ON public.ipam_vlan USING btree (role_id);


--
-- Name: ipam_vlan_site_id_a59334e3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_site_id_a59334e3 ON public.ipam_vlan USING btree (site_id);


--
-- Name: ipam_vlan_tenant_id_71a8290d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_tenant_id_71a8290d ON public.ipam_vlan USING btree (tenant_id);


--
-- Name: ipam_vlangroup_scope_type_id_6606a755; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_scope_type_id_6606a755 ON public.ipam_vlangroup USING btree (scope_type_id);


--
-- Name: ipam_vlangroup_slug_40abcf6b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b ON public.ipam_vlangroup USING btree (slug);


--
-- Name: ipam_vlangroup_slug_40abcf6b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b_like ON public.ipam_vlangroup USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_vrf_export_targets_routetarget_id_8d9319f7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_export_targets_routetarget_id_8d9319f7 ON public.ipam_vrf_export_targets USING btree (routetarget_id);


--
-- Name: ipam_vrf_export_targets_vrf_id_6f4875c4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_export_targets_vrf_id_6f4875c4 ON public.ipam_vrf_export_targets USING btree (vrf_id);


--
-- Name: ipam_vrf_import_targets_routetarget_id_0e05b144; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_import_targets_routetarget_id_0e05b144 ON public.ipam_vrf_import_targets USING btree (routetarget_id);


--
-- Name: ipam_vrf_import_targets_vrf_id_ed491b19; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_import_targets_vrf_id_ed491b19 ON public.ipam_vrf_import_targets USING btree (vrf_id);


--
-- Name: ipam_vrf_rd_0ac1bde1_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_rd_0ac1bde1_like ON public.ipam_vrf USING btree (rd varchar_pattern_ops);


--
-- Name: ipam_vrf_tenant_id_498b0051; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_tenant_id_498b0051 ON public.ipam_vrf USING btree (tenant_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: tenancy_tenant_group_id_7daef6f4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_group_id_7daef6f4 ON public.tenancy_tenant USING btree (group_id);


--
-- Name: tenancy_tenant_name_f6e5b2f5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_name_f6e5b2f5_like ON public.tenancy_tenant USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenant_slug_0716575e_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_slug_0716575e_like ON public.tenancy_tenant USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_name_53363199_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_name_53363199_like ON public.tenancy_tenantgroup USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_parent_id_2542fc18; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_parent_id_2542fc18 ON public.tenancy_tenantgroup USING btree (parent_id);


--
-- Name: tenancy_tenantgroup_slug_e2af1cb6_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_slug_e2af1cb6_like ON public.tenancy_tenantgroup USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_tree_id_769a98bf; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_tree_id_769a98bf ON public.tenancy_tenantgroup USING btree (tree_id);


--
-- Name: users_objectpermission_groups_group_id_fb7ba6e0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_groups_group_id_fb7ba6e0 ON public.users_objectpermission_groups USING btree (group_id);


--
-- Name: users_objectpermission_groups_objectpermission_id_2f7cc117; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_groups_objectpermission_id_2f7cc117 ON public.users_objectpermission_groups USING btree (objectpermission_id);


--
-- Name: users_objectpermission_obj_objectpermission_id_38c7d8f5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_obj_objectpermission_id_38c7d8f5 ON public.users_objectpermission_object_types USING btree (objectpermission_id);


--
-- Name: users_objectpermission_object_types_contenttype_id_594b1cc7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_object_types_contenttype_id_594b1cc7 ON public.users_objectpermission_object_types USING btree (contenttype_id);


--
-- Name: users_objectpermission_users_objectpermission_id_78a9c2e6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_users_objectpermission_id_78a9c2e6 ON public.users_objectpermission_users USING btree (objectpermission_id);


--
-- Name: users_objectpermission_users_user_id_16c0905d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_users_user_id_16c0905d ON public.users_objectpermission_users USING btree (user_id);


--
-- Name: users_token_key_820deccd_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_token_key_820deccd_like ON public.users_token USING btree (key varchar_pattern_ops);


--
-- Name: users_token_user_id_af964690; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_token_user_id_af964690 ON public.users_token USING btree (user_id);


--
-- Name: virtualization_cluster_group_id_de379828; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_group_id_de379828 ON public.virtualization_cluster USING btree (group_id);


--
-- Name: virtualization_cluster_name_1b59a61b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_name_1b59a61b_like ON public.virtualization_cluster USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_cluster_site_id_4d5af282; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_site_id_4d5af282 ON public.virtualization_cluster USING btree (site_id);


--
-- Name: virtualization_cluster_tenant_id_bc2868d0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_tenant_id_bc2868d0 ON public.virtualization_cluster USING btree (tenant_id);


--
-- Name: virtualization_cluster_type_id_4efafb0a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_type_id_4efafb0a ON public.virtualization_cluster USING btree (type_id);


--
-- Name: virtualization_clustergroup_name_4fcd26b4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustergroup_name_4fcd26b4_like ON public.virtualization_clustergroup USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustergroup_slug_57ca1d23_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustergroup_slug_57ca1d23_like ON public.virtualization_clustergroup USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_clustertype_name_ea854d3d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustertype_name_ea854d3d_like ON public.virtualization_clustertype USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustertype_slug_8ee4d0e0_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustertype_slug_8ee4d0e0_like ON public.virtualization_clustertype USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_virtualmachine_cluster_id_6c9f9047; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_cluster_id_6c9f9047 ON public.virtualization_virtualmachine USING btree (cluster_id);


--
-- Name: virtualization_virtualmachine_platform_id_a6c5ccb2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_platform_id_a6c5ccb2 ON public.virtualization_virtualmachine USING btree (platform_id);


--
-- Name: virtualization_virtualmachine_role_id_0cc898f9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_role_id_0cc898f9 ON public.virtualization_virtualmachine USING btree (role_id);


--
-- Name: virtualization_virtualmachine_tenant_id_d00d1d77; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_tenant_id_d00d1d77 ON public.virtualization_virtualmachine USING btree (tenant_id);


--
-- Name: virtualization_vminterface_parent_id_f86958e1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_parent_id_f86958e1 ON public.virtualization_vminterface USING btree (parent_id);


--
-- Name: virtualization_vminterface_tagged_vlans_vlan_id_4e77411e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_tagged_vlans_vlan_id_4e77411e ON public.virtualization_vminterface_tagged_vlans USING btree (vlan_id);


--
-- Name: virtualization_vminterface_tagged_vlans_vminterface_id_904b12de; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_tagged_vlans_vminterface_id_904b12de ON public.virtualization_vminterface_tagged_vlans USING btree (vminterface_id);


--
-- Name: virtualization_vminterface_untagged_vlan_id_aea4fc69; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_untagged_vlan_id_aea4fc69 ON public.virtualization_vminterface USING btree (untagged_vlan_id);


--
-- Name: virtualization_vminterface_virtual_machine_id_e9f89829; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_virtual_machine_id_e9f89829 ON public.virtualization_vminterface USING btree (virtual_machine_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_provider_id_d9195418_fk_circuits_provider_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_d9195418_fk_circuits_provider_id FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_termination_a_id_f891adac_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_termination_a_id_f891adac_fk_circuits_ FOREIGN KEY (termination_a_id) REFERENCES public.circuits_circuittermination(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_termination_z_id_377b8551_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_termination_z_id_377b8551_fk_circuits_ FOREIGN KEY (termination_z_id) REFERENCES public.circuits_circuittermination(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id FOREIGN KEY (type_id) REFERENCES public.circuits_circuittype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm__cable_peer_type_id_bd122156_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm__cable_peer_type_id_bd122156_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_circuit_id_257e87e7_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_circuit_id_257e87e7_fk_circuits_ FOREIGN KEY (circuit_id) REFERENCES public.circuits_circuit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_ FOREIGN KEY (provider_network_id) REFERENCES public.circuits_providernetwork(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_providernetwork circuits_providernet_provider_id_7992236c_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernet_provider_id_7992236c_fk_circuits_ FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id FOREIGN KEY (_termination_a_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id FOREIGN KEY (_termination_b_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_termination_a_type_i_a614bab8_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_a_type_i_a614bab8_fk_django_co FOREIGN KEY (termination_a_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_termination_b_type_i_a91595d0_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_b_type_i_a91595d0_fk_django_co FOREIGN KEY (termination_b_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cablepath dcim_cablepath_destination_type_id_a8c1654b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_destination_type_id_a8c1654b_fk_django_co FOREIGN KEY (destination_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cablepath dcim_cablepath_origin_type_id_6de54f6d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_origin_type_id_6de54f6d_fk_django_co FOREIGN KEY (origin_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport__cable_peer_type_id_52adb1be_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport__cable_peer_type_id_52adb1be_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverpo__cable_peer_type_id_132b6744_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverpo__cable_peer_type_id_132b6744_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id FOREIGN KEY (device_role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_location_id_11a7bedb_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_location_id_11a7bedb_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_platform_id_468138f1_fk_dcim_platform_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_platform_id_468138f1_fk_dcim_platform_id FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_rack_id_23bde71f_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_23bde71f_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_site_id_ff897cf6_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_site_id_ff897cf6_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt FOREIGN KEY (virtual_chassis_id) REFERENCES public.dcim_virtualchassis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id FOREIGN KEY (installed_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebaytemplate dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport__cable_peer_type_id_c4690f56_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport__cable_peer_type_id_c4690f56_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_device_id_950557b5_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_device_id_950557b5_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface__cable_peer_type_id_ce52cb81_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__cable_peer_type_id_ce52cb81_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_cable_id_1b264edb_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_cable_id_1b264edb_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_device_id_359c6115_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_359c6115_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id FOREIGN KEY (lag_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_parent_id_3e2b159b_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_parent_id_3e2b159b_fk_dcim_interface_id FOREIGN KEY (parent_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfacetemplate dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id FOREIGN KEY (parent_id) REFERENCES public.dcim_inventoryitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_parent_id_d77f3318_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_parent_id_d77f3318_fk_dcim_location_id FOREIGN KEY (parent_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_site_id_b55e975f_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_site_id_b55e975f_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_platform dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed__cable_peer_type_id_9f930589_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed__cable_peer_type_id_9f930589_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id FOREIGN KEY (power_panel_id) REFERENCES public.dcim_powerpanel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet__cable_peer_type_id_bbff28d0_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet__cable_peer_type_id_bbff28d0_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_location_id_474b60f8_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_location_id_474b60f8_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport__cable_peer_type_id_9df2a278_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__cable_peer_type_id_9df2a278_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_device_id_ef7185ae_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_ef7185ae_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerporttemplate dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_location_id_5f63ec31_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_location_id_5f63ec31_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id FOREIGN KEY (role_id) REFERENCES public.dcim_rackrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_site_id_403c7b3a_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_site_id_403c7b3a_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_user_id_0785a527_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_user_id_0785a527_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport__cable_peer_type_id_cecf241c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport__cable_peer_type_id_cecf241c_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearporttemplate dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_region dcim_region_parent_id_2486f5d4_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_parent_id_2486f5d4_fk_dcim_region_id FOREIGN KEY (parent_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_group_id_3910c975_fk_dcim_sitegroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_group_id_3910c975_fk_dcim_sitegroup_id FOREIGN KEY (group_id) REFERENCES public.dcim_sitegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_region_id_45210932_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_region_id_45210932_fk_dcim_region_id FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_sitegroup dcim_sitegroup_parent_id_533a5e44_fk_dcim_sitegroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_parent_id_533a5e44_fk_dcim_sitegroup_id FOREIGN KEY (parent_id) REFERENCES public.dcim_sitegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id FOREIGN KEY (master_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_clusters extras_configcontext_cluster_id_6abd47a1_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_cluster_id_6abd47a1_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz FOREIGN KEY (clustergroup_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_configcontext_id_2a516699_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_configcontext_id_2a516699_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_site_groups extras_configcontext_configcontext_id_2e0f43cb_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_2e0f43cb_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_device_types extras_configcontext_configcontext_id_55632923_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_configcontext_id_55632923_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_configcontext_id_59b67386_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_configcontext_id_59b67386_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tags extras_configcontext_configcontext_id_64a392b1_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_configcontext_id_64a392b1_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_configcontext_id_73003dbc_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_configcontext_id_73003dbc_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_configcontext_id_8c54feb9_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_configcontext_id_8c54feb9_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_configcontext_id_8f50b794_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_8f50b794_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_configcontext_id_92f68345_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_92f68345_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_configcontext_id_b53552a6_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_configcontext_id_b53552a6_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_clusters extras_configcontext_configcontext_id_ed579a40_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_configcontext_id_ed579a40_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi FOREIGN KEY (devicerole_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_device_types extras_configcontext_devicetype_id_b8788c2d_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_devicetype_id_b8788c2d_fk_dcim_devi FOREIGN KEY (devicetype_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_region_id_35c6ba9d_fk_dcim_regi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_region_id_35c6ba9d_fk_dcim_regi FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_site_groups extras_configcontext_sitegroup_id_3287c9e7_fk_dcim_site; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_sitegroup_id_3287c9e7_fk_dcim_site FOREIGN KEY (sitegroup_id) REFERENCES public.dcim_sitegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tags extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t FOREIGN KEY (tenantgroup_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_content_types extras_customfield_c_contenttype_id_2997ba90_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_c_contenttype_id_2997ba90_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_content_types extras_customfield_c_customfield_id_3842aaf3_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_c_customfield_id_3842aaf3_fk_extras_cu FOREIGN KEY (customfield_id) REFERENCES public.extras_customfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customlink extras_customlink_content_type_id_4d35b063_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_content_type_id_4d35b063_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_exporttemplate extras_exporttemplat_content_type_id_59737e21_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplat_content_type_id_59737e21_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_imageattachment extras_imageattachme_content_type_id_90e0643d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachme_content_type_id_90e0643d_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id FOREIGN KEY (obj_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_user_id_d35285ab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_user_id_d35285ab_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_journalentry extras_journalentry_assigned_object_type_1bba9f68_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry
    ADD CONSTRAINT extras_journalentry_assigned_object_type_1bba9f68_fk_django_co FOREIGN KEY (assigned_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_journalentry extras_journalentry_created_by_id_8d4e4329_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry
    ADD CONSTRAINT extras_journalentry_created_by_id_8d4e4329_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_changed_object_type__b755bb60_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_changed_object_type__b755bb60_fk_django_co FOREIGN KEY (changed_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_related_object_type__fe6e521f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_related_object_type__fe6e521f_fk_django_co FOREIGN KEY (related_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_user_id_7fdf8186_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_user_id_7fdf8186_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_content_type_id_ba5562ed_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_content_type_id_ba5562ed_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_content_types extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_content_types extras_webhook_conte_webhook_id_0c169800_fk_extras_we; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_conte_webhook_id_0c169800_fk_extras_we FOREIGN KEY (webhook_id) REFERENCES public.extras_webhook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id FOREIGN KEY (rir_id) REFERENCES public.ipam_rir(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_assigned_object_type_02354370_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_assigned_object_type_02354370_fk_django_co FOREIGN KEY (assigned_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id FOREIGN KEY (nat_inside_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_iprange ipam_iprange_role_id_2782e864_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_role_id_2782e864_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_iprange ipam_iprange_tenant_id_856027ea_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_tenant_id_856027ea_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_iprange ipam_iprange_vrf_id_613e9dd2_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_vrf_id_613e9dd2_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_role_id_0a98d415_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_role_id_0a98d415_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_site_id_0b20df05_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_site_id_0b20df05_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_routetarget ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_device_id_b4d2bb9c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_device_id_b4d2bb9c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad FOREIGN KEY (ipaddress_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id FOREIGN KEY (service_id) REFERENCES public.ipam_service(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_virtual_machine_id_e8b53562_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_virtual_machine_id_e8b53562_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id FOREIGN KEY (group_id) REFERENCES public.ipam_vlangroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_role_id_f5015962_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_role_id_f5015962_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_site_id_a59334e3_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_site_id_a59334e3_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlangroup ipam_vlangroup_scope_type_id_6606a755_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_scope_type_id_6606a755_fk_django_content_type_id FOREIGN KEY (scope_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_vrf_id_6f4875c4_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_vrf_id_6f4875c4_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_vrf_id_ed491b19_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_vrf_id_ed491b19_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenant tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id FOREIGN KEY (group_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_t FOREIGN KEY (parent_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_object_types users_objectpermissi_contenttype_id_594b1cc7_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermissi_contenttype_id_594b1cc7_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_groups users_objectpermissi_group_id_fb7ba6e0_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermissi_group_id_fb7ba6e0_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_groups users_objectpermissi_objectpermission_id_2f7cc117_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_2f7cc117_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_object_types users_objectpermissi_objectpermission_id_38c7d8f5_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_38c7d8f5_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_users users_objectpermissi_objectpermission_id_78a9c2e6_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_78a9c2e6_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_users users_objectpermission_users_user_id_16c0905d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_users_user_id_16c0905d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_token users_token_user_id_af964690_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_user_id_af964690_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_userconfig users_userconfig_user_id_afd44184_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_user_id_afd44184_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_group_id_de379828_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_group_id_de379828_fk_virtualiz FOREIGN KEY (group_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_type_id_4efafb0a_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_type_id_4efafb0a_fk_virtualiz FOREIGN KEY (type_id) REFERENCES public.virtualization_clustertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_site_id_4d5af282_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_site_id_4d5af282_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_role_id_0cc898f9_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_role_id_0cc898f9_fk_dcim_devi FOREIGN KEY (role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_parent_id_f86958e1_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_parent_id_f86958e1_fk_virtualiz FOREIGN KEY (parent_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vmint_vminterface_id_904b12de_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vmint_vminterface_id_904b12de_fk_virtualiz FOREIGN KEY (vminterface_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

