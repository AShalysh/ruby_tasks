module Company
	def set_company(name)
		self.company_name = name
	end

	def get_company_name
		self.company_name
	end

	def print_company_name
		puts self.company_name
	end

	protected
	attr_accessor :company_name
end