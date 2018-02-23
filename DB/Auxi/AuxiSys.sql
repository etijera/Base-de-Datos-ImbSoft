
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


------ Ejmeplo manejo de Xquery

SELECT	@ValorAjusteRec = T.c.value('@Valor','MONEY') 
		,@ValorADescontarAjusteRec = T.c.value('@ValorADescontar','MONEY') 
		,@ValorAPagarAjusteRec = T.c.value('@ValorAPagar','MONEY') 
FROM	@XMLReajusteRecaudos.nodes('/r/Ds/s')T(c)
WHERE	T.c.value('@IdServicio','INT') = @IdOrigen
		AND T.c.value('@CodServicio','VARCHAR(20)') = @CodigoOrigen
		AND T.c.value('@TipoRecaudo','VARCHAR(4)') = @TipoRecaudo
		AND T.c.value('@TipoServicio','VARCHAR(4)') = @TipoOrigen

SELECT	@JustificacionAjusteRec = @XMLReajusteRecaudos.value('(/r/C/@Justificacion)[1]','VARCHAR(3)')  
		,@ObservacionAjusteRec = @XMLReajusteRecaudos.value('(/r/C/@Observaciones)[1]','VARCHAR(500)')