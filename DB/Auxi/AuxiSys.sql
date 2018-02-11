
-- Contabilidad, Asientos
select top 1 * from casientos

-- Contabilidad, Movimientos
select top 1 *  from cMovimientos

-- Plan unico de cuentas
select * from cCuentasGenerales order by codigo
select * from cCuentasDetalle order by codigo

-- Configuracion
select * from cRelPucImpuesto
select * from cReteICA
select * from cComprobantes
select * from cImpuestos
select * from ClasesContables
select * from cReteICA