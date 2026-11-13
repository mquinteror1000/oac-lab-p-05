library ieee;
use ieee.std_logic_1164.all;
-- Definicion de la identidad
entity practica5 is
	port (
		pto0: in std_logic;
		pto1: in std_logic;
		sel: in std_logic;
		ptops: out std_logic
	);
end practica5;

-- 1. Opcion mediante compuertas
architecture arq_compuertas of practica5 is
begin
	ptops <= ( pto0 and ( not sel ) ) or ( pto1 and sel );
end arq_compuertas;

-- 2. Opcion mediante compuertas, salidas intemedias
architecture arq_senales of practica5 is
signal sig0, sig1: std_logic;
begin
	sig0 <= pto0 and (not sel);
	sig1 <= pto1 and sel;
	ptops <= sig0 or sig1;
end arq_senales;

-- 3. Opcion mediante sentencia recurrente utilizando when
architecture arq_when of practica5 is
begin
	ptops <= pto0 when sel='0' else pto1;
end arq_when;

-- 4. Opcion mediante sentencia recurrente utilizando proceso
architecture arq_proceso of practica5 is
begin
	proceso: process ( sel, pto0, pto1 )
	begin
		if sel = '0' then
			ptops <= pto0;
		else 
			ptops <= pto1;
		end if;
	end process;
end arq_proceso;