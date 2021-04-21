DECLARE
    v_dml_type VARCHAR2(10);
    x_payload  VARCHAR2(32760) := '{';   
    cursor op is
    select * from olydev.fdblop
    order by lplpro, lplid, lplref, lplseq;
    
    x_count   number :=  0;
    x_startdate date;
    x_enddate date;
    --
BEGIN

    v_dml_type := 'UPDATE';
    x_startdate := sysdate;
    -- 
    for rop in op
    loop
        
        x_payload := '{';
                  
        x_payload := x_payload || DATA_CONS.p_s('clcdom', ROP.CLCDOM) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clfmo1', ROP.CLFMO1) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clfmo2', ROP.CLFMO2) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clfmo3', ROP.CLFMO3) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldder1', ROP.CLDDER1) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldder2', ROP.CLDDER2) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldder3', ROP.CLDDER3) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldpro1', ROP.CLDPRO1) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldpro2', ROP.CLDPRO2) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldpro3', ROP.CLDPRO3) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clfresc', ROP.CLFRESC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cltyesc', ROP.CLTYESC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clfmo4', ROP.CLFMO4) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldder4', ROP.CLDDER4) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldpro4', ROP.CLDPRO4) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clftit', ROP.CLFTIT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cltyti', ROP.CLTYTI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clfmo5', ROP.CLFMO5) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldder5', ROP.CLDDER5) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldpro5', ROP.CLDPRO5) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq211', ROP.CLSQ211) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex211', ROP.CLEX211) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq212', ROP.CLSQ212) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex212', ROP.CLEX212) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq213', ROP.CLSQ213) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex213', ROP.CLEX213) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq214', ROP.CLSQ214) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex214', ROP.CLEX214) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq215', ROP.CLSQ215) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex215', ROP.CLEX215) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq221', ROP.CLSQ221) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex221', ROP.CLEX221) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq222', ROP.CLSQ222) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex222', ROP.CLEX222) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq223', ROP.CLSQ223) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex223', ROP.CLEX223) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq224', ROP.CLSQ224) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex224', ROP.CLEX224) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq225', ROP.CLSQ225) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex225', ROP.CLEX225) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clia', ROP.CLIA) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clfrav', ROP.CLFRAV) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clssty', ROP.CLSSTY) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clfperf', ROP.CLFPERF) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsperf', ROP.CLSPERF) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clfrele', ROP.CLFRELE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cltrele', ROP.CLTRELE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clfill', ROP.CLFILL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clfres', ROP.CLFRES) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cltyes', ROP.CLTYES) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clfrfi', ROP.CLFRFI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cltyfi', ROP.CLTYFI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clfr03', ROP.CLFR03) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clty03', ROP.CLTY03) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq11', ROP.CLSQ11) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex11', ROP.CLEX11) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq12', ROP.CLSQ12) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex12', ROP.CLEX12) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq13', ROP.CLSQ13) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex13', ROP.CLEX13) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq14', ROP.CLSQ14) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex14', ROP.CLEX14) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq15', ROP.CLSQ15) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex15', ROP.CLEX15) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq21', ROP.CLSQ21) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex21', ROP.CLEX21) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq22', ROP.CLSQ22) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex22', ROP.CLEX22) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq23', ROP.CLSQ23) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex23', ROP.CLEX23) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq24', ROP.CLSQ24) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex24', ROP.CLEX24) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq25', ROP.CLSQ25) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex25', ROP.CLEX25) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq31', ROP.CLSQ31) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex31', ROP.CLEX31) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq32', ROP.CLSQ32) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex32', ROP.CLEX32) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq33', ROP.CLSQ33) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex33', ROP.CLEX33) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq34', ROP.CLSQ34) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex34', ROP.CLEX34) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsq35', ROP.CLSQ35) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clex35', ROP.CLEX35) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clju01', ROP.CLJU01) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clju02', ROP.CLJU02) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clju03', ROP.CLJU03) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clju04', ROP.CLJU04) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clju05', ROP.CLJU05) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clju06', ROP.CLJU06) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clju07', ROP.CLJU07) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clju08', ROP.CLJU08) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clju09', ROP.CLJU09) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clju10', ROP.CLJU10) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clju11', ROP.CLJU11) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clju12', ROP.CLJU12) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clju13', ROP.CLJU13) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clju14', ROP.CLJU14) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clju15', ROP.CLJU15) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clds01', ROP.CLDS01) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldr01', ROP.CLDR01) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clds02', ROP.CLDS02) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldr02', ROP.CLDR02) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clds03', ROP.CLDS03) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldr03', ROP.CLDR03) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clraci', ROP.CLRACI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cletat', ROP.CLETAT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldtou', ROP.CLDTOU) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldtmu', ROP.CLDTMU) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldtan', ROP.CLDTAN) || ',';

        x_payload := x_payload || DATA_CONS.p_l('clnbrm', ROP.CLNBRM) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cloprn', ROP.CLOPRN) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clgrpe', ROP.CLGRPE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clagnt', ROP.CLAGNT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clcent', ROP.CLCENT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clgera', ROP.CLGERA) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cletcv', ROP.CLETCV) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clnom', ROP.CLNOM) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clprnm', ROP.CLPRNM) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clorig', ROP.CLORIG) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cltype', ROP.CLTYPE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clnomc', ROP.CLNOMC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldtna', ROP.CLDTNA) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldtdc', ROP.CLDTDC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsrcd', ROP.CLSRCD) || ',';

        x_payload := x_payload || DATA_CONS.p_l('cllnge', ROP.CLLNGE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clcdex', ROP.CLCDEX) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldesi', ROP.CLDESI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clad01', ROP.CLAD01) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clad02', ROP.CLAD02) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clad03', ROP.CLAD03) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clad04', ROP.CLAD04) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clad05', ROP.CLAD05) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clad06', ROP.CLAD06) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldomi', ROP.CLDOMI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clregi', ROP.CLREGI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clnati', ROP.CLNATI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clacti', ROP.CLACTI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsect', ROP.CLSECT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clrgma', ROP.CLRGMA) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsymp', ROP.CLSYMP) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clmone', ROP.CLMONE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clmonp', ROP.CLMONP) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cltlph', ROP.CLTLPH) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cltlex', ROP.CLTLEX) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cltlfx', ROP.CLTLFX) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clswft', ROP.CLSWFT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsic', ROP.CLSIC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clautr', ROP.CLAUTR) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clgiro', ROP.CLGIRO) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clprof', ROP.CLPROF) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clgest', ROP.CLGEST) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clobje', ROP.CLOBJE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clgrpg', ROP.CLGRPG) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clger2', ROP.CLGER2) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clger3', ROP.CLGER3) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clnatu', ROP.CLNATU) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clscte', ROP.CLSCTE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clnacp', ROP.CLNACP) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldomr', ROP.CLDOMR) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clsegm', ROP.CLSEGM) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clpotn', ROP.CLPOTN) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clctva', ROP.CLCTVA) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clcpin', ROP.CLCPIN) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clcpri', ROP.CLCPRI) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clcrin', ROP.CLCRIN) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clcpdn', ROP.CLCPDN) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clds04', ROP.CLDS04) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldr04', ROP.CLDR04) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clds05', ROP.CLDS05) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldr05', ROP.CLDR05) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clds06', ROP.CLDS06) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldr06', ROP.CLDR06) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clds07', ROP.CLDS07) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldr07', ROP.CLDR07) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clds08', ROP.CLDS08) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldr08', ROP.CLDR08) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clds09', ROP.CLDS09) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldr09', ROP.CLDR09) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clds10', ROP.CLDS10) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldr10', ROP.CLDR10) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clds11', ROP.CLDS11) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldr11', ROP.CLDR11) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clds12', ROP.CLDS12) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldr12', ROP.CLDR12) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clds13', ROP.CLDS13) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldr13', ROP.CLDR13) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clds14', ROP.CLDS14) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldr14', ROP.CLDR14) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clds15', ROP.CLDS15) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldr15', ROP.CLDR15) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clfi02', ROP.CLFI02) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clrfar', ROP.CLRFAR) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clrfan', ROP.CLRFAN) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clrmdu', ROP.CLRMDU) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clrmau', ROP.CLRMAU) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clrmar', ROP.CLRMAR) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clrman', ROP.CLRMAN) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cltent', ROP.CLTENT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clafil', ROP.CLAFIL) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldorm', ROP.CLDORM) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldspm', ROP.CLDSPM) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cltric', ROP.CLTRIC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clrare', ROP.CLRARE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clckest', ROP.CLCKEST) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clgtar', ROP.CLGTAR) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clciba', ROP.CLCIBA) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clmess', ROP.CLMESS) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clcccc', ROP.CLCCCC) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cltyad', ROP.CLTYAD) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cldpre', ROP.CLDPRE) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clcnib', ROP.CLCNIB) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cloent', ROP.CLOENT) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clprfd', ROP.CLPRFD) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cltyrv', ROP.CLTYRV) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clitty', ROP.CLITTY) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clprfs', ROP.CLPRFS) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cltyou', ROP.CLTYOU) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clcomo', ROP.CLCOMO) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clvisp', ROP.CLVISP) || ',';

        x_payload := x_payload || DATA_CONS.p_s('cltypa', ROP.CLTYPA) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clnopa', ROP.CLNOPA) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clgfid', ROP.CLGFID) || ',';

        x_payload := x_payload || DATA_CONS.p_s('clfi03', ROP.CLFI03);

        x_payload := x_payload || '}';

        INSERT INTO DATA_CONS.EVENT_HISTORY (ID, TABLE_NAME, ROW_ID, "TIMESTAMP", DML_COMMAND, EVENT_TYPE, PAYLOAD, TRANSACTION_ID, VERSION, STATUS)
        VALUES (DATA_CONS.EVENT_HISTORY_SEQ.nextval, 'FDBCLI', ROP.CLRACI, sysdate, v_dml_type, 'FDBCLI_INSERT_OR_UPDATE', x_payload, '0','0.1.0', 'INITIATED');
        --
        x_count := x_count + 1;
        --
        if mod(x_count, 500) = 0 then
            commit;
        end if;
        --
    END LOOP;    
    --
    commit;
    --
    x_enddate := sysdate;
    
    dbms_output.put_line ('Transformed ' ||x_count || ' FDBCLI Records.');    
    dbms_output.put_line('Elapsed Time : ' || to_char(to_date('1970-01-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss')+(x_enddate - x_startdate),'hh24:mi:ss'));
    -- 
END;