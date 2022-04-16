import java.io.File;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

class LatinSquareWrapper {
	public static void main(String[] args) throws IOException {
		// Проверка аргументов
		if (args.length < 1) {
			System.out.println("For Start Use: java LatinSquareWrapper [FileName]");
			
			return;
		}

		// Проверка наличия файла
		File f = new File(args[0]);
		
		if(!f.exists() || f.isDirectory()) { 
			System.out.format("File %s Not Found\n", args[0]);

			return;
		}

		// Чтение файла
		List<String[]> data = new ArrayList<String[]>();

		int columnsCount = -1;

		try (BufferedReader br = new BufferedReader(new FileReader(f)))	{
			String line;

			while ((line = br.readLine()) != null) {
				// Разбивка строки на колонки
				String[] columns = line.trim().split(" ");

				if (columns.length == 0) {
					continue;
				}

				if (columnsCount == -1)	{
					columnsCount = columns.length;
				}
				else if (columnsCount != columns.length) {
					System.out.println("Format File Not Correct");

					return;
				}

				data.add(columns);
			}
		}

		// Проверка что файл содержит квадратную матрицу
		if (columnsCount == -1 || data.size() != columnsCount) {
			System.out.println("Format File Not Correct");

			return;
		}

		int countAnswer = 0;

		// Запуск субпроцессов
		for (int i = 0; i < columnsCount; i++) {
			Process process = Runtime.getRuntime().exec(String.format("java LatinSquare %s %d", args[0], i + 1));

			BufferedReader stdInput = new BufferedReader(new InputStreamReader(process.getInputStream()));

			String s = null;
			String result = "";

			// Получение результата выполнения
			while ((s = stdInput.readLine()) != null) {
				result += s;
			}
			
			countAnswer += Integer.parseInt(result);
		}
		
		// Вывод результата
		System.out.format("Count Answers: %d\n", countAnswer);
    }
}