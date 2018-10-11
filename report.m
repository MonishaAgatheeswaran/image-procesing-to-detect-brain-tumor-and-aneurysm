import mlreportgen.dom.*
rpt_type='pdf';
doc=Document('mydoc',rpt_type);
append(doc,'Helloworld');
close(doc);
rptview(doc.OutputPath);

