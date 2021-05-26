DECLARE 
    @cd_produto int,
	@ds_marca VARCHAR(MAX),
	@ds_descricao VARCHAR(MAX),
	@ds_situacaotrib VARCHAR(MAX),
    @vl_unitario int,
    @in_icms int,
    @in_ipi int,
    @vl_seguro int,
    @cd_situacaotrib int,
    @vl_total int;

DECLARE product_cursor CURSOR
FOR SELECT 
        Cd_Produto,
        Ds_Marca,
        Ds_Descricao,
        Ds_SituacaoTrib,
        Vl_Unitario,
        In_ICMS,
        In_IPI,
        Vl_Seguro,
        Cd_SituacaoTrib,
        Vl_Total
    FROM 
        Produto;

OPEN product_cursor;

FETCH NEXT FROM product_cursor INTO 
    @cd_produto,
    @ds_marca,
    @ds_descricao,
    @ds_situacaotrib,
    @vl_unitario,
    @in_icms,
    @in_ipi,
    @vl_seguro,
    @cd_situacaotrib,
    @vl_total;

WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT  
            CAST(@cd_produto AS VARCHAR) + ', ' +
            @ds_marca+ ', ' +
            @ds_descricao+ ', ' +
            @ds_situacaotrib+ ', ' +
            CAST(@vl_unitario AS VARCHAR) + ', ' +
            CAST(@in_icms AS VARCHAR) + ', ' +
            CAST(@in_ipi AS VARCHAR) + ', ' +
            CAST(@vl_seguro AS VARCHAR) + ', ' +
            CAST(@cd_situacaotrib AS VARCHAR) + ', ' +
            CAST(@vl_total AS VARCHAR);
            
        FETCH NEXT FROM product_cursor INTO 
            @cd_produto,
            @ds_marca,
            @ds_descricao,
            @ds_situacaotrib,
            @vl_unitario,
            @in_icms,
            @in_ipi,
            @vl_seguro,
            @cd_situacaotrib,
            @vl_total;
    END;

CLOSE product_cursor;

DEALLOCATE product_cursor;