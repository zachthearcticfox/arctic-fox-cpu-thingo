import zlib, base64

def encodeToMemory(data: list[int]) -> str: # made by __spetzers__
		huge_memory_size = 65535
		while huge_memory_size > len(data):
				data.append(0)
		
		temp = []
		for index in data:
				bit1 = index & 0xFF
				bit2 = (index >> 8) & 8
				temp.append(bit1)
				temp.append(bit2)
		data = temp

		byte_data = bytes(data)
		compressed = zlib.compress(byte_data, level=2, wbits=-zlib.MAX_WBITS)
		compressed_b64 = base64.b64encode(compressed)
		code = compressed_b64.decode("utf-8")

		if code.endswith("=="):
				code = code[:-2]
		elif code.endswith("="):
				code = code[:-1]

		return code

print(encodeToMemory([0, 0, 0, 0, 16, 15, 14, 13, 12, 11, 10, 9]))