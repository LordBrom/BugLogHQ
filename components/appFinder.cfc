<cfcomponent extends="finder">
	
	<cffunction name="findByID" returnType="app" access="public">
		<cfargument name="id" type="numeric" required="true">
		<cfscript>
			var qry = variables.oDAO.get(arguments.id);
			var o = 0;
			
			if(qry.recordCount gt 0) {
				o = createObject("component","app").init( variables.oDAO );
				o.setApplicationID(qry.applicationID);
				o.setName(qry.name);
				o.setCode(qry.code);
				return o;
			} else {
				throw("ID not found","appFinderException.IDNotFound");
			}
		</cfscript>
	</cffunction>

	<cffunction name="findByCode" returnType="app" access="public">
		<cfargument name="code" type="string" required="true">
		<cfscript>
			var qry = variables.oDAO.getByLabel(arguments.code);
			var o = 0;
			
			if(qry.recordCount gt 0) {
				o = createObject("component","app").init( variables.oDAO );
				o.setApplicationID(qry.applicationID);
				o.setName(qry.name);
				o.setCode(qry.code);
				return o;
			} else {
				throw("Application code not found","appFinderException.ApplicationCodeNotFound");
			}
		</cfscript>
	</cffunction>

</cfcomponent>