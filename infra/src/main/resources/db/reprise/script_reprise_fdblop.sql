DECLARE
    v_dml_type VARCHAR2(10);
    x  VARCHAR2(32760) := '{';   
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
        
        x := '{';
                  
x := x || DATA_CONS.p_s('opemetmon6', ROP.OPEMETMON6) || ',';

x := x || DATA_CONS.p_d('opemetmnt6', ROP.OPEMETMNT6) || ',';

x := x || DATA_CONS.p_s('opbqinter', ROP.OPBQINTER) || ',';

x := x || DATA_CONS.p_d('opmtrecu', ROP.OPMTRECU) || ',';

x := x || DATA_CONS.p_d('opmtfrac', ROP.OPMTFRAC) || ',';

x := x || DATA_CONS.p_s('opmotext', ROP.OPMOTEXT) || ',';

x := x || DATA_CONS.p_s('opl5benef', ROP.OPL5BENEF) || ',';

x := x || DATA_CONS.p_s('opstpout', ROP.OPSTPOUT) || ',';

x := x || DATA_CONS.p_s('oporisaie', ROP.OPORISAIE) || ',';

x := x || DATA_CONS.p_s('opinsaext', ROP.OPINSAEXT) || ',';

x := x || DATA_CONS.p_s('ll5dordre', ROP.LL5DORDRE) || ',';

x := x || DATA_CONS.p_s('lsstat', ROP.LSSTAT) || ',';

x := x || DATA_CONS.p_s('lspres', ROP.LSPRES) || ',';

x := x || DATA_CONS.p_s('lstpre', ROP.LSTPRE) || ',';

x := x || DATA_CONS.p_s('lsnrem', ROP.LSNREM) || ',';

x := x || DATA_CONS.p_s('lsmpcc', ROP.LSMPCC) || ',';

x := x || DATA_CONS.p_s('lstypd', ROP.LSTYPD) || ',';

x := x || DATA_CONS.p_s('lsrefc', ROP.LSREFC) || ',';

x := x || DATA_CONS.p_s('lsracs', ROP.LSRACS) || ',';

x := x || DATA_CONS.p_s('lscdbq', ROP.LSCDBQ) || ',';

x := x || DATA_CONS.p_s('lslies', ROP.LSLIES) || ',';

x := x || DATA_CONS.p_s('lssoa1', ROP.LSSOA1) || ',';

x := x || DATA_CONS.p_s('lssoa2', ROP.LSSOA2) || ',';

x := x || DATA_CONS.p_s('lssoa3', ROP.LSSOA3) || ',';

x := x || DATA_CONS.p_s('lssoa4', ROP.LSSOA4) || ',';

x := x || DATA_CONS.p_s('lscom1', ROP.LSCOM1) || ',';

x := x || DATA_CONS.p_s('lscom2', ROP.LSCOM2) || ',';

x := x || DATA_CONS.p_s('lscom3', ROP.LSCOM3) || ',';

x := x || DATA_CONS.p_s('lscom4', ROP.LSCOM4) || ',';

x := x || DATA_CONS.p_s('lscom5', ROP.LSCOM5) || ',';

x := x || DATA_CONS.p_s('lscom6', ROP.LSCOM6) || ',';

x := x || DATA_CONS.p_s('lscom7', ROP.LSCOM7) || ',';

x := x || DATA_CONS.p_s('lscom8', ROP.LSCOM8) || ',';

x := x || DATA_CONS.p_d('lsbrub', ROP.LSBRUB) || ',';

x := x || DATA_CONS.p_d('lscomb', ROP.LSCOMB) || ',';

x := x || DATA_CONS.p_d('lsnetb', ROP.LSNETB) || ',';

x := x || DATA_CONS.p_d('lsbruc', ROP.LSBRUC) || ',';

x := x || DATA_CONS.p_d('lscomc', ROP.LSCOMC) || ',';

x := x || DATA_CONS.p_d('lsnetc', ROP.LSNETC) || ',';

x := x || DATA_CONS.p_s('lsnume', ROP.LSNUME) || ',';

x := x || DATA_CONS.p_s('lsnumm', ROP.LSNUMM) || ',';

x := x || DATA_CONS.p_s('lsnumc', ROP.LSNUMC) || ',';

x := x || DATA_CONS.p_s('lscptprim', ROP.LSCPTPRIM) || ',';

x := x || DATA_CONS.p_s('lsopeprim', ROP.LSOPEPRIM) || ',';

x := x || DATA_CONS.p_s('lsfild', ROP.LSFILD) || ',';

x := x || DATA_CONS.p_s('lstyop', ROP.LSTYOP) || ',';

x := x || DATA_CONS.p_s('lsndoc', ROP.LSNDOC) || ',';

x := x || DATA_CONS.p_s('lstyeffet', ROP.LSTYEFFET) || ',';

x := x || DATA_CONS.p_s('ldbraccom1', ROP.LDBRACCOM1) || ',';

x := x || DATA_CONS.p_s('ldbgrecom1', ROP.LDBGRECOM1) || ',';

x := x || DATA_CONS.p_s('ldbrubcom1', ROP.LDBRUBCOM1) || ',';

x := x || DATA_CONS.p_s('ldbmoncom1', ROP.LDBMONCOM1) || ',';

x := x || DATA_CONS.p_s('lsigdcom1', ROP.LSIGDCOM1) || ',';

x := x || DATA_CONS.p_d('lmtdbcom1', ROP.LMTDBCOM1) || ',';

x := x || DATA_CONS.p_d('lmtdbtva1', ROP.LMTDBTVA1) || ',';

x := x || DATA_CONS.p_s('ldbccours', ROP.LDBCCOURS) || ',';

x := x || DATA_CONS.p_d('lmtdbcou1', ROP.LMTDBCOU1) || ',';

x := x || DATA_CONS.p_s('ldbraccom2', ROP.LDBRACCOM2) || ',';

x := x || DATA_CONS.p_s('ldbgrecom2', ROP.LDBGRECOM2) || ',';

x := x || DATA_CONS.p_s('ldbrubcom2', ROP.LDBRUBCOM2) || ',';

x := x || DATA_CONS.p_s('ldbmoncom2', ROP.LDBMONCOM2) || ',';

x := x || DATA_CONS.p_s('lsigdcom2', ROP.LSIGDCOM2) || ',';

x := x || DATA_CONS.p_d('lmtdbcom2', ROP.LMTDBCOM2) || ',';

x := x || DATA_CONS.p_d('lmtdbtva2', ROP.LMTDBTVA2) || ',';

x := x || DATA_CONS.p_s('ldbccours2', ROP.LDBCCOURS2) || ',';

x := x || DATA_CONS.p_d('lmtdbcou2', ROP.LMTDBCOU2) || ',';

x := x || DATA_CONS.p_s('ldbracfra1', ROP.LDBRACFRA1) || ',';

x := x || DATA_CONS.p_s('ldbgrefra1', ROP.LDBGREFRA1) || ',';

x := x || DATA_CONS.p_s('ldbrubfra1', ROP.LDBRUBFRA1) || ',';

x := x || DATA_CONS.p_s('ldbmonfra1', ROP.LDBMONFRA1) || ',';

x := x || DATA_CONS.p_s('lsigdfra1', ROP.LSIGDFRA1) || ',';

x := x || DATA_CONS.p_d('ldbmtfra1', ROP.LDBMTFRA1) || ',';

x := x || DATA_CONS.p_d('lmtdbfra1', ROP.LMTDBFRA1) || ',';

x := x || DATA_CONS.p_s('ldbccouf1', ROP.LDBCCOUF1) || ',';

x := x || DATA_CONS.p_d('lmtdbcrs1', ROP.LMTDBCRS1) || ',';

x := x || DATA_CONS.p_s('ldbractva1', ROP.LDBRACTVA1) || ',';

x := x || DATA_CONS.p_s('ldbgretva1', ROP.LDBGRETVA1) || ',';

x := x || DATA_CONS.p_s('ldbrubtva1', ROP.LDBRUBTVA1) || ',';

x := x || DATA_CONS.p_s('ldbmontva1', ROP.LDBMONTVA1) || ',';

x := x || DATA_CONS.p_s('lsigdtva1', ROP.LSIGDTVA1) || ',';

x := x || DATA_CONS.p_d('ldbmttva1', ROP.LDBMTTVA1) || ',';

x := x || DATA_CONS.p_s('ldbccout1', ROP.LDBCCOUT1) || ',';

x := x || DATA_CONS.p_d('lmtdbcrt1', ROP.LMTDBCRT1) || ',';

x := x || DATA_CONS.p_s('lcrraccom1', ROP.LCRRACCOM1) || ',';

x := x || DATA_CONS.p_s('lcrgrecom1', ROP.LCRGRECOM1) || ',';

x := x || DATA_CONS.p_s('lcrrubcom1', ROP.LCRRUBCOM1) || ',';

x := x || DATA_CONS.p_s('lcrmoncom1', ROP.LCRMONCOM1) || ',';

x := x || DATA_CONS.p_s('lsigccom1', ROP.LSIGCCOM1) || ',';

x := x || DATA_CONS.p_d('lmtcrcom1', ROP.LMTCRCOM1) || ',';

x := x || DATA_CONS.p_d('lmtcrtva1', ROP.LMTCRTVA1) || ',';

x := x || DATA_CONS.p_s('lcrccours', ROP.LCRCCOURS) || ',';

x := x || DATA_CONS.p_d('lmtcrcou1', ROP.LMTCRCOU1) || ',';

x := x || DATA_CONS.p_s('lcrraccom2', ROP.LCRRACCOM2) || ',';

x := x || DATA_CONS.p_s('lcrgrecom2', ROP.LCRGRECOM2) || ',';

x := x || DATA_CONS.p_s('lcrrubcom2', ROP.LCRRUBCOM2) || ',';

x := x || DATA_CONS.p_s('lcrmoncom2', ROP.LCRMONCOM2) || ',';

x := x || DATA_CONS.p_s('lsigccom2', ROP.LSIGCCOM2) || ',';

x := x || DATA_CONS.p_d('lmtcrcom2', ROP.LMTCRCOM2) || ',';

x := x || DATA_CONS.p_d('lmtcrtva2', ROP.LMTCRTVA2) || ',';

x := x || DATA_CONS.p_s('lcrccours2', ROP.LCRCCOURS2) || ',';

x := x || DATA_CONS.p_d('lmtcrcou2', ROP.LMTCRCOU2) || ',';

x := x || DATA_CONS.p_s('lcrracfra1', ROP.LCRRACFRA1) || ',';

x := x || DATA_CONS.p_s('opbqde', ROP.OPBQDE) || ',';

x := x || DATA_CONS.p_s('opbqcd', ROP.OPBQCD) || ',';

x := x || DATA_CONS.p_s('opbqin', ROP.OPBQIN) || ',';

x := x || DATA_CONS.p_s('opbqc1', ROP.OPBQC1) || ',';

x := x || DATA_CONS.p_s('opbqc2', ROP.OPBQC2) || ',';

x := x || DATA_CONS.p_s('opbqc3', ROP.OPBQC3) || ',';

x := x || DATA_CONS.p_s('opbqc4', ROP.OPBQC4) || ',';

x := x || DATA_CONS.p_s('opbqc5', ROP.OPBQC5) || ',';

x := x || DATA_CONS.p_s('opbqc6', ROP.OPBQC6) || ',';

x := x || DATA_CONS.p_s('opdmop', ROP.OPDMOP) || ',';

x := x || DATA_CONS.p_s('opdcnt', ROP.OPDCNT) || ',';

x := x || DATA_CONS.p_s('opdccc', ROP.OPDCCC) || ',';

x := x || DATA_CONS.p_s('opdcca', ROP.OPDCCA) || ',';

x := x || DATA_CONS.p_s('opdida', ROP.OPDIDA) || ',';

x := x || DATA_CONS.p_s('opdnda', ROP.OPDNDA) || ',';

x := x || DATA_CONS.p_s('opcmop', ROP.OPCMOP) || ',';

x := x || DATA_CONS.p_s('opccnt', ROP.OPCCNT) || ',';

x := x || DATA_CONS.p_s('opcccl', ROP.OPCCCL) || ',';

x := x || DATA_CONS.p_s('opccca', ROP.OPCCCA) || ',';

x := x || DATA_CONS.p_s('opcida', ROP.OPCIDA) || ',';

x := x || DATA_CONS.p_s('opcnoa', ROP.OPCNOA) || ',';

x := x || DATA_CONS.p_s('opfilr', ROP.OPFILR) || ',';

x := x || DATA_CONS.p_s('opdbct', ROP.OPDBCT) || ',';

x := x || DATA_CONS.p_s('opdsfr', ROP.OPDSFR) || ',';

x := x || DATA_CONS.p_d('opdcvc', ROP.OPDCVC) || ',';

x := x || DATA_CONS.p_d('opdttc', ROP.OPDTTC) || ',';

x := x || DATA_CONS.p_s('opdcpr', ROP.OPDCPR) || ',';

x := x || DATA_CONS.p_s('opdast', ROP.OPDAST) || ',';

x := x || DATA_CONS.p_s('opdctl', ROP.OPDCTL) || ',';

x := x || DATA_CONS.p_s('opdccb', ROP.OPDCCB) || ',';

x := x || DATA_CONS.p_s('opdtsf', ROP.OPDTSF) || ',';

x := x || DATA_CONS.p_s('opdtc1', ROP.OPDTC1) || ',';

x := x || DATA_CONS.p_s('opdtc2', ROP.OPDTC2) || ',';

x := x || DATA_CONS.p_s('opdtsb', ROP.OPDTSB) || ',';

x := x || DATA_CONS.p_s('opdmcl', ROP.OPDMCL) || ',';

x := x || DATA_CONS.p_s('opdcch', ROP.OPDCCH) || ',';

x := x || DATA_CONS.p_s('opdcmc', ROP.OPDCMC) || ',';

x := x || DATA_CONS.p_s('opdcfl', ROP.OPDCFL) || ',';

x := x || DATA_CONS.p_s('opcrct', ROP.OPCRCT) || ',';

x := x || DATA_CONS.p_s('opcsfr', ROP.OPCSFR) || ',';

x := x || DATA_CONS.p_d('opccvc', ROP.OPCCVC) || ',';

x := x || DATA_CONS.p_d('opcttc', ROP.OPCTTC) || ',';

x := x || DATA_CONS.p_s('opccpr', ROP.OPCCPR) || ',';

x := x || DATA_CONS.p_s('opcast', ROP.OPCAST) || ',';

x := x || DATA_CONS.p_s('opcdtl', ROP.OPCDTL) || ',';

x := x || DATA_CONS.p_s('opcccb', ROP.OPCCCB) || ',';

x := x || DATA_CONS.p_s('opctsf', ROP.OPCTSF) || ',';

x := x || DATA_CONS.p_s('opctc1', ROP.OPCTC1) || ',';

x := x || DATA_CONS.p_s('opctc2', ROP.OPCTC2) || ',';

x := x || DATA_CONS.p_s('opctsb', ROP.OPCTSB) || ',';

x := x || DATA_CONS.p_s('opcmcl', ROP.OPCMCL) || ',';

x := x || DATA_CONS.p_s('opccch', ROP.OPCCCH) || ',';

x := x || DATA_CONS.p_s('opcccc', ROP.OPCCCC) || ',';

x := x || DATA_CONS.p_s('opccfl', ROP.OPCCFL) || ',';

x := x || DATA_CONS.p_s('opdsfs', ROP.OPDSFS) || ',';

x := x || DATA_CONS.p_s('opdsc1', ROP.OPDSC1) || ',';

x := x || DATA_CONS.p_s('opdsc2', ROP.OPDSC2) || ',';

x := x || DATA_CONS.p_s('opdstv', ROP.OPDSTV) || ',';

x := x || DATA_CONS.p_s('opcsfa', ROP.OPCSFA) || ',';

x := x || DATA_CONS.p_s('opcsc1', ROP.OPCSC1) || ',';

x := x || DATA_CONS.p_s('opcsc2', ROP.OPCSC2) || ',';

x := x || DATA_CONS.p_s('opcstv', ROP.OPCSTV) || ',';

x := x || DATA_CONS.p_s('opddcd', ROP.OPDDCD) || ',';

x := x || DATA_CONS.p_s('opcdcd', ROP.OPCDCD) || ',';

x := x || DATA_CONS.p_s('opdfrt', ROP.OPDFRT) || ',';

x := x || DATA_CONS.p_s('opdc1t', ROP.OPDC1T) || ',';

x := x || DATA_CONS.p_s('opdc2t', ROP.OPDC2T) || ',';

x := x || DATA_CONS.p_s('opdfrc', ROP.OPDFRC) || ',';

x := x || DATA_CONS.p_s('opdc1c', ROP.OPDC1C) || ',';

x := x || DATA_CONS.p_s('opdc2c', ROP.OPDC2C) || ',';

x := x || DATA_CONS.p_s('opdtvc', ROP.OPDTVC) || ',';

x := x || DATA_CONS.p_s('opcfrt', ROP.OPCFRT) || ',';

x := x || DATA_CONS.p_s('opcc1t', ROP.OPCC1T) || ',';

x := x || DATA_CONS.p_s('opcc2t', ROP.OPCC2T) || ',';

x := x || DATA_CONS.p_s('opcfrc', ROP.OPCFRC) || ',';

x := x || DATA_CONS.p_s('opcc1c', ROP.OPCC1C) || ',';

x := x || DATA_CONS.p_s('opcc2c', ROP.OPCC2C) || ',';

x := x || DATA_CONS.p_s('opctvc', ROP.OPCTVC) || ',';

x := x || DATA_CONS.p_d('opdtmr', ROP.OPDTMR) || ',';

x := x || DATA_CONS.p_d('opdtml', ROP.OPDTML) || ',';

x := x || DATA_CONS.p_d('opdtcb', ROP.OPDTCB) || ',';

x := x || DATA_CONS.p_d('opctmr', ROP.OPCTMR) || ',';

x := x || DATA_CONS.p_d('opctml', ROP.OPCTML) || ',';

x := x || DATA_CONS.p_d('opctcb', ROP.OPCTCB) || ',';

x := x || DATA_CONS.p_s('opamono', ROP.OPAMONO) || ',';

x := x || DATA_CONS.p_s('opnmono', ROP.OPNMONO) || ',';

x := x || DATA_CONS.p_d('opmtori', ROP.OPMTORI) || ',';

x := x || DATA_CONS.p_d('opchgori', ROP.OPCHGORI) || ',';

x := x || DATA_CONS.p_s('opcchgori', ROP.OPCCHGORI) || ',';

x := x || DATA_CONS.p_s('opdtvalo', ROP.OPDTVALO) || ',';

x := x || DATA_CONS.p_s('opnatcrp', ROP.OPNATCRP) || ',';

x := x || DATA_CONS.p_s('oppaycrp', ROP.OPPAYCRP) || ',';

x := x || DATA_CONS.p_s('opcindbal', ROP.OPCINDBAL) || ',';

x := x || DATA_CONS.p_s('opstp', ROP.OPSTP) || ',';

x := x || DATA_CONS.p_s('opemetmon1', ROP.OPEMETMON1) || ',';

x := x || DATA_CONS.p_d('opemetmnt1', ROP.OPEMETMNT1) || ',';

x := x || DATA_CONS.p_s('opemetmon2', ROP.OPEMETMON2) || ',';

x := x || DATA_CONS.p_d('opemetmnt2', ROP.OPEMETMNT2) || ',';

x := x || DATA_CONS.p_s('opemetmon3', ROP.OPEMETMON3) || ',';

x := x || DATA_CONS.p_d('opemetmnt3', ROP.OPEMETMNT3) || ',';

x := x || DATA_CONS.p_s('opemetmon4', ROP.OPEMETMON4) || ',';

x := x || DATA_CONS.p_d('opemetmnt4', ROP.OPEMETMNT4) || ',';

x := x || DATA_CONS.p_s('opemetmon5', ROP.OPEMETMON5) || ',';

x := x || DATA_CONS.p_d('opemetmnt5', ROP.OPEMETMNT5) || ',';

x := x || DATA_CONS.p_s('opopvi', ROP.OPOPVI) || ',';

x := x || DATA_CONS.p_s('opsopt', ROP.OPSOPT) || ',';

x := x || DATA_CONS.p_s('opdjex', ROP.OPDJEX) || ',';

x := x || DATA_CONS.p_s('oprfex', ROP.OPRFEX) || ',';

x := x || DATA_CONS.p_s('opceav', ROP.OPCEAV) || ',';

x := x || DATA_CONS.p_s('opsini', ROP.OPSINI) || ',';

x := x || DATA_CONS.p_s('opnlot', ROP.OPNLOT) || ',';

x := x || DATA_CONS.p_s('opdljj', ROP.OPDLJJ) || ',';

x := x || DATA_CONS.p_s('opdlmm', ROP.OPDLMM) || ',';

x := x || DATA_CONS.p_s('opdlaa', ROP.OPDLAA) || ',';

x := x || DATA_CONS.p_s('opslot', ROP.OPSLOT) || ',';

x := x || DATA_CONS.p_s('opilot', ROP.OPILOT) || ',';

x := x || DATA_CONS.p_s('opdchc', ROP.OPDCHC) || ',';

x := x || DATA_CONS.p_s('opcchc', ROP.OPCCHC) || ',';

x := x || DATA_CONS.p_s('opfil0', ROP.OPFIL0) || ',';

x := x || DATA_CONS.p_s('opdbrc', ROP.OPDBRC) || ',';

x := x || DATA_CONS.p_s('opdbgr', ROP.OPDBGR) || ',';

x := x || DATA_CONS.p_s('opdbru', ROP.OPDBRU) || ',';

x := x || DATA_CONS.p_s('opdbnm', ROP.OPDBNM) || ',';

x := x || DATA_CONS.p_s('opcrrc', ROP.OPCRRC) || ',';

x := x || DATA_CONS.p_s('opcrgr', ROP.OPCRGR) || ',';

x := x || DATA_CONS.p_s('opcrru', ROP.OPCRRU) || ',';

x := x || DATA_CONS.p_s('opcrnm', ROP.OPCRNM) || ',';

x := x || DATA_CONS.p_s('opdbcc', ROP.OPDBCC) || ',';

x := x || DATA_CONS.p_s('opcrcc', ROP.OPCRCC) || ',';

x := x || DATA_CONS.p_s('opdord', ROP.OPDORD) || ',';

x := x || DATA_CONS.p_s('opdope', ROP.OPDOPE) || ',';

x := x || DATA_CONS.p_s('oprecp', ROP.OPRECP) || ',';

x := x || DATA_CONS.p_s('opvref', ROP.OPVREF) || ',';

x := x || DATA_CONS.p_s('opemip', ROP.OPEMIP) || ',';

x := x || DATA_CONS.p_s('opdbao', ROP.OPDBAO) || ',';

x := x || DATA_CONS.p_s('opdbac', ROP.OPDBAC) || ',';

x := x || DATA_CONS.p_s('opdbtv', ROP.OPDBTV) || ',';

x := x || DATA_CONS.p_s('opdbaf', ROP.OPDBAF) || ',';

x := x || DATA_CONS.p_s('opdbc1', ROP.OPDBC1) || ',';

x := x || DATA_CONS.p_s('opdbc2', ROP.OPDBC2) || ',';

x := x || DATA_CONS.p_s('opdbat', ROP.OPDBAT) || ',';

x := x || DATA_CONS.p_d('opdbmt', ROP.OPDBMT) || ',';

x := x || DATA_CONS.p_s('opdccr', ROP.OPDCCR) || ',';

x := x || DATA_CONS.p_d('opdcrs', ROP.OPDCRS) || ',';

x := x || DATA_CONS.p_d('opdbmc', ROP.OPDBMC) || ',';

x := x || DATA_CONS.p_d('opdtva', ROP.OPDTVA) || ',';

x := x || DATA_CONS.p_d('opdfrs', ROP.OPDFRS) || ',';

x := x || DATA_CONS.p_d('opdcm1', ROP.OPDCM1) || ',';

x := x || DATA_CONS.p_d('opdcm2', ROP.OPDCM2) || ',';

x := x || DATA_CONS.p_d('opdnmc', ROP.OPDNMC) || ',';

x := x || DATA_CONS.p_s('opddav', ROP.OPDDAV) || ',';

x := x || DATA_CONS.p_s('opcbao', ROP.OPCBAO) || ',';

x := x || DATA_CONS.p_s('opcbac', ROP.OPCBAC) || ',';

x := x || DATA_CONS.p_s('opcbtv', ROP.OPCBTV) || ',';

x := x || DATA_CONS.p_s('opcbaf', ROP.OPCBAF) || ',';

x := x || DATA_CONS.p_s('opcbc1', ROP.OPCBC1) || ',';

x := x || DATA_CONS.p_s('opcbc2', ROP.OPCBC2) || ',';

x := x || DATA_CONS.p_s('opcbat', ROP.OPCBAT) || ',';

x := x || DATA_CONS.p_d('opcbmt', ROP.OPCBMT) || ',';

x := x || DATA_CONS.p_s('opcccr', ROP.OPCCCR) || ',';

x := x || DATA_CONS.p_d('opccrs', ROP.OPCCRS) || ',';

x := x || DATA_CONS.p_d('opcbmc', ROP.OPCBMC) || ',';

x := x || DATA_CONS.p_d('opctva', ROP.OPCTVA) || ',';

x := x || DATA_CONS.p_d('opcfrs', ROP.OPCFRS) || ',';

x := x || DATA_CONS.p_d('opccm1', ROP.OPCCM1) || ',';

x := x || DATA_CONS.p_d('opccm2', ROP.OPCCM2) || ',';

x := x || DATA_CONS.p_d('opcnmc', ROP.OPCNMC) || ',';

x := x || DATA_CONS.p_s('opcdav', ROP.OPCDAV) || ',';

x := x || DATA_CONS.p_s('opfben', ROP.OPFBEN) || ',';

x := x || DATA_CONS.p_s('opford', ROP.OPFORD) || ',';

x := x || DATA_CONS.p_s('opdora', ROP.OPDORA) || ',';

x := x || DATA_CONS.p_s('opdoa1', ROP.OPDOA1) || ',';

x := x || DATA_CONS.p_s('opdoa2', ROP.OPDOA2) || ',';

x := x || DATA_CONS.p_s('opdoa3', ROP.OPDOA3) || ',';

x := x || DATA_CONS.p_s('opdoa4', ROP.OPDOA4) || ',';

x := x || DATA_CONS.p_s('opbco1', ROP.OPBCO1) || ',';

x := x || DATA_CONS.p_s('opbco2', ROP.OPBCO2) || ',';

x := x || DATA_CONS.p_s('opbco3', ROP.OPBCO3) || ',';

x := x || DATA_CONS.p_s('opbco4', ROP.OPBCO4) || ',';

x := x || DATA_CONS.p_s('opbco5', ROP.OPBCO5) || ',';

x := x || DATA_CONS.p_s('opbira', ROP.OPBIRA) || ',';

x := x || DATA_CONS.p_s('opbia1', ROP.OPBIA1) || ',';

x := x || DATA_CONS.p_s('opbia2', ROP.OPBIA2) || ',';

x := x || DATA_CONS.p_s('opbia3', ROP.OPBIA3) || ',';

x := x || DATA_CONS.p_s('opbia4', ROP.OPBIA4) || ',';

x := x || DATA_CONS.p_s('opbera', ROP.OPBERA) || ',';

x := x || DATA_CONS.p_s('opbea1', ROP.OPBEA1) || ',';

x := x || DATA_CONS.p_s('opbea2', ROP.OPBEA2) || ',';

x := x || DATA_CONS.p_s('opbea3', ROP.OPBEA3) || ',';

x := x || DATA_CONS.p_s('opbea4', ROP.OPBEA4) || ',';

x := x || DATA_CONS.p_s('oprbo1', ROP.OPRBO1) || ',';

x := x || DATA_CONS.p_s('oprbo2', ROP.OPRBO2) || ',';

x := x || DATA_CONS.p_s('oprbo3', ROP.OPRBO3) || ',';

x := x || DATA_CONS.p_s('oprbo4', ROP.OPRBO4) || ',';

x := x || DATA_CONS.p_s('opdbli', ROP.OPDBLI) || ',';

x := x || DATA_CONS.p_s('opcrli', ROP.OPCRLI) || ',';

x := x || DATA_CONS.p_s('opeche', ROP.OPECHE) || ',';

x := x || DATA_CONS.p_s('opibd1', ROP.OPIBD1) || ',';

x := x || DATA_CONS.p_s('opibd4', ROP.OPIBD4) || ',';

x := x || DATA_CONS.p_s('opicr1', ROP.OPICR1) || ',';

x := x || DATA_CONS.p_s('opicr4', ROP.OPICR4) || ',';

x := x || DATA_CONS.p_s('opcchq', ROP.OPCCHQ) || ',';

x := x || DATA_CONS.p_s('oprefo', ROP.OPREFO) || ',';

x := x || DATA_CONS.p_s('opimpc', ROP.OPIMPC) || ',';

x := x || DATA_CONS.p_s('opdgef', ROP.OPDGEF) || ',';

x := x || DATA_CONS.p_s('opdruf', ROP.OPDRUF) || ',';

x := x || DATA_CONS.p_s('opcgef', ROP.OPCGEF) || ',';

x := x || DATA_CONS.p_s('opcruf', ROP.OPCRUF) || ',';

x := x || DATA_CONS.p_s('opecra', ROP.OPECRA) || ',';

x := x || DATA_CONS.p_s('opagce', ROP.OPAGCE) || ',';

x := x || DATA_CONS.p_s('opfill', ROP.OPFILL) || ',';

x := x || DATA_CONS.p_l('lplpro', ROP.LPLPRO) || ',';

x := x || DATA_CONS.p_l('lplid', ROP.LPLID) || ',';

x := x || DATA_CONS.p_l('lplref', ROP.LPLREF) || ',';

x := x || DATA_CONS.p_l('lplseq', ROP.LPLSEQ) || ',';

x := x || DATA_CONS.p_s('lpstat', ROP.LPSTAT) || ',';

x := x || DATA_CONS.p_s('lpcpta', ROP.LPCPTA) || ',';

x := x || DATA_CONS.p_s('lpconf', ROP.LPCONF) || ',';

x := x || DATA_CONS.p_s('lpdtjj', ROP.LPDTJJ) || ',';

x := x || DATA_CONS.p_s('lpdtmm', ROP.LPDTMM) || ',';

x := x || DATA_CONS.p_s('lpdtaa', ROP.LPDTAA) || ',';

x := x || DATA_CONS.p_s('lptime', ROP.LPTIME) || ',';

x := x || DATA_CONS.p_s('lplopr', ROP.LPLOPR) || ',';

x := x || DATA_CONS.p_s('lpctrl', ROP.LPCTRL) || ',';

x := x || DATA_CONS.p_s('opid', ROP.OPID) || ',';

x := x || DATA_CONS.p_s('opnope', ROP.OPNOPE) || ',';

x := x || DATA_CONS.p_s('opnseq', ROP.OPNSEQ) || ',';

x := x || DATA_CONS.p_s('opcopt', ROP.OPCOPT) || ',';

x := x || DATA_CONS.p_s('opcsts', ROP.OPCSTS) || ',';

x := x || DATA_CONS.p_s('opoper', ROP.OPOPER) || ',';

x := x || DATA_CONS.p_s('opcntr', ROP.OPCNTR) || ',';

x := x || DATA_CONS.p_s('oppepa', ROP.OPPEPA) || ',';

x := x || DATA_CONS.p_s('oppeco', ROP.OPPECO) || ',';

x := x || DATA_CONS.p_s('opsupa', ROP.OPSUPA) || ',';

x := x || DATA_CONS.p_s('opsupm', ROP.OPSUPM) || ',';

x := x || DATA_CONS.p_s('opfct1', ROP.OPFCT1) || ',';

x := x || DATA_CONS.p_s('opops1', ROP.OPOPS1) || ',';

x := x || DATA_CONS.p_s('opfct2', ROP.OPFCT2) || ',';

x := x || DATA_CONS.p_s('opops2', ROP.OPOPS2) || ',';

x := x || DATA_CONS.p_s('opopen', ROP.OPOPEN) || ',';

x := x || DATA_CONS.p_s('openrd', ROP.OPENRD) || ',';

x := x || DATA_CONS.p_s('openrh', ROP.OPENRH) || ',';

x := x || DATA_CONS.p_s('lcrgrefra1', ROP.LCRGREFRA1) || ',';

x := x || DATA_CONS.p_s('lcrrubfra1', ROP.LCRRUBFRA1) || ',';

x := x || DATA_CONS.p_s('lcrmonfra1', ROP.LCRMONFRA1) || ',';

x := x || DATA_CONS.p_s('lsigcfra1', ROP.LSIGCFRA1) || ',';

x := x || DATA_CONS.p_d('lcrmtfra1', ROP.LCRMTFRA1) || ',';

x := x || DATA_CONS.p_d('lmtcrfra1', ROP.LMTCRFRA1) || ',';

x := x || DATA_CONS.p_s('lcrccouf1', ROP.LCRCCOUF1) || ',';

x := x || DATA_CONS.p_d('lmtcrcrs1', ROP.LMTCRCRS1) || ',';

x := x || DATA_CONS.p_s('lcrractva1', ROP.LCRRACTVA1) || ',';

x := x || DATA_CONS.p_s('lcrgretva1', ROP.LCRGRETVA1) || ',';

x := x || DATA_CONS.p_s('lcrrubtva1', ROP.LCRRUBTVA1) || ',';

x := x || DATA_CONS.p_s('lcrmontva1', ROP.LCRMONTVA1) || ',';

x := x || DATA_CONS.p_s('lsigctva1', ROP.LSIGCTVA1) || ',';

x := x || DATA_CONS.p_d('lcrmttva1', ROP.LCRMTTVA1) || ',';

x := x || DATA_CONS.p_s('lcrccout1', ROP.LCRCCOUT1) || ',';

x := x || DATA_CONS.p_d('lmtcrcrt1', ROP.LMTCRCRT1) || ',';

x := x || DATA_CONS.p_s('lcdregle', ROP.LCDREGLE) || ',';

x := x || DATA_CONS.p_d('lmtregle', ROP.LMTREGLE) || ',';

x := x || DATA_CONS.p_d('lmtmini', ROP.LMTMINI) || ',';

x := x || DATA_CONS.p_d('ltxpena', ROP.LTXPENA) || ',';

x := x || DATA_CONS.p_d('lmtpena', ROP.LMTPENA) || ',';

x := x || DATA_CONS.p_s('lmonpena', ROP.LMONPENA) || ',';

x := x || DATA_CONS.p_l('lmtpreav', ROP.LMTPREAV) || ',';

x := x || DATA_CONS.p_s('ldtpreval', ROP.LDTPREVAL) || ',';

x := x || DATA_CONS.p_s('ldtpre', ROP.LDTPRE) || ',';

x := x || DATA_CONS.p_s('lracpena', ROP.LRACPENA) || ',';

x := x || DATA_CONS.p_s('lgrepena', ROP.LGREPENA) || ',';

x := x || DATA_CONS.p_s('lrubpena', ROP.LRUBPENA) || ',';

x := x || DATA_CONS.p_s('lmoncpen', ROP.LMONCPEN) || ',';

x := x || DATA_CONS.p_s('lnbrjrs', ROP.LNBRJRS) || ',';

x := x || DATA_CONS.p_s('loptpena', ROP.LOPTPENA) || ',';

x := x || DATA_CONS.p_s('lprorata', ROP.LPRORATA) || ',';

x := x || DATA_CONS.p_s('loptmin', ROP.LOPTMIN) || ',';

x := x || DATA_CONS.p_s('lgenope', ROP.LGENOPE) || ',';

x := x || DATA_CONS.p_s('lidrs', ROP.LIDRS) || ',';

x := x || DATA_CONS.p_s('lnors', ROP.LNORS) || ',';

x := x || DATA_CONS.p_s('lddj', ROP.LDDJ) || ',';

x := x || DATA_CONS.p_s('lnetting', ROP.LNETTING) || ',';

x := x || DATA_CONS.p_s('lctrdech', ROP.LCTRDECH) || ',';

x := x || DATA_CONS.p_s('lctrfech', ROP.LCTRFECH) || ',';

x := x || DATA_CONS.p_d('lctrcapi', ROP.LCTRCAPI) || ',';

x := x || DATA_CONS.p_s('lidrsirs1', ROP.LIDRSIRS1) || ',';

x := x || DATA_CONS.p_s('lidrnors1', ROP.LIDRNORS1) || ',';

x := x || DATA_CONS.p_d('lintirs1', ROP.LINTIRS1) || ',';

x := x || DATA_CONS.p_s('lidrsirs2', ROP.LIDRSIRS2) || ',';

x := x || DATA_CONS.p_s('lidrnors2', ROP.LIDRNORS2) || ',';

x := x || DATA_CONS.p_d('lintirs2', ROP.LINTIRS2) || ',';

x := x || DATA_CONS.p_s('lbqeint', ROP.LBQEINT) || ',';

x := x || DATA_CONS.p_s('lguiint', ROP.LGUIINT) || ',';

x := x || DATA_CONS.p_s('lnovale', ROP.LNOVALE) || ',';

x := x || DATA_CONS.p_s('lrefbvr', ROP.LREFBVR) || ',';

x := x || DATA_CONS.p_s('leditavi', ROP.LEDITAVI) || ',';

x := x || DATA_CONS.p_s('leditavit', ROP.LEDITAVIT) || ',';

x := x || DATA_CONS.p_s('lecrrgr', ROP.LECRRGR) || ',';

x := x || DATA_CONS.p_s('ltrtrgr', ROP.LTRTRGR) || ',';

x := x || DATA_CONS.p_s('lecrrgrg', ROP.LECRRGRG) || ',';

x := x || DATA_CONS.p_s('lrefima', ROP.LREFIMA) || ',';

x := x || DATA_CONS.p_s('loriginel', ROP.LORIGINEL) || ',';

x := x || DATA_CONS.p_s('lsens', ROP.LSENS) || ',';

x := x || DATA_CONS.p_s('lvilbranc', ROP.LVILBRANC) || ',';

x := x || DATA_CONS.p_s('lmemsepa', ROP.LMEMSEPA) || ',';

x := x || DATA_CONS.p_s('ldbdatvala', ROP.LDBDATVALA) || ',';

x := x || DATA_CONS.p_s('lcrdatvala', ROP.LCRDATVALA) || ',';

x := x || DATA_CONS.p_d('lrcrco', ROP.LRCRCO) || ',';

x := x || DATA_CONS.p_d('lrcrbi', ROP.LRCRBI) || ',';

x := x || DATA_CONS.p_d('lrcrmt', ROP.LRCRMT) || ',';

x := x || DATA_CONS.p_s('lpres1', ROP.LPRES1) || ',';

x := x || DATA_CONS.p_s('lpbref', ROP.LPBREF) || ',';

x := x || DATA_CONS.p_s('lpreserve', ROP.LPRESERVE);

x := x || '}';

        INSERT /*+ APPEND */ INTO DATA_CONS.EVENT_HISTORY (ID, TABLE_NAME, ROW_ID, "TIMESTAMP", DML_COMMAND, EVENT_TYPE, PAYLOAD, TRANSACTION_ID, VERSION, STATUS)
        VALUES (DATA_CONS.EVENT_HISTORY_SEQ.nextval, 'FDBLOP', ROP.LPLPRO||ROP.LPLID ||ROP.LPLREF ||ROP.LPLSEQ, sysdate, v_dml_type, 'FDBLOP_INSERT_OR_UPDATE', x, '0','0.1.0', 'INITIATED');

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
    
    dbms_output.put_line ('Transformed ' ||x_count || ' FDBLOP Records.');    
    dbms_output.put_line('Elapsed Time : ' || to_char(to_date('1970-01-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss')+(x_enddate - x_startdate),'hh24:mi:ss'));
    -- 
END;