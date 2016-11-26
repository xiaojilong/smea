package org.xiaojl.commons.utils;

import java.io.File;

public class GenEasyUIIcons {
	
	
	public static void main(String[] args) {
		File f = new File("E:"+File.separator+"workspace_8"+File.separator+"sme"+
							File.separator+"WebRoot"+File.separator+"static"+File.separator+
							"jquery-easyui-1.5"+File.separator+"extIcon"+File.separator+"icons");
//		genEasyUIicons(f);
		genEasyUIiconData(f);
	}
	
	
	public static void genEasyUIicons(File srcFile){
		File[] files = srcFile.listFiles();
		for(int i=0;files!=null && i<files.length;i++){
			File f = files[i];
			if(f.isDirectory()){
				genEasyUIicons(f);
			}else{
				/**
				 * .icon-refresh{
						background:url('icons/refresh.png') no-repeat center center;
					}
				 */
				
				String line1 = ".";
				String url = "icons/";
				String fileName = f.getName();
				String fileNameNoSuffix = fileName.substring(0, fileName.indexOf("."));
				
				String fileParent = f.getParent();
				if(fileParent.endsWith("icons")){
					line1 += "icon-";
					
				}else{
					String pk = fileParent.substring(fileParent.lastIndexOf("\\")+1);
					line1 += pk+"-";
					url += pk+"/";
				}
				line1 += fileNameNoSuffix +"{";
				url += fileName;
				
				String result = line1 +"\n"+ "	background:url('"+url+"') no-repeat center center; " +"\n"+"}";
				
				System.out.println(result);
			}
		}
	}
	
	
	public static void genEasyUIiconData(File srcFile){
		File[] files = srcFile.listFiles();
		for(int i=0;files!=null && i<files.length;i++){
			File f = files[i];
			if(f.isDirectory()){
				genEasyUIiconData(f);
			}else{
				/**
				 * .icon-refresh{
				 	{
						value : 'folder_wrench',
						text : 'folder_wrench'
					},
					
				 */
				
				String line1 = "";
				String fileName = f.getName();
				String fileNameNoSuffix = fileName.substring(0, fileName.indexOf("."));
				
				String fileParent = f.getParent();
				if(fileParent.endsWith("icons")){
					line1 += "icon-";
					
				}else{
					String pk = fileParent.substring(fileParent.lastIndexOf("\\")+1);
					line1 += pk+"-";
				}
				line1 += fileNameNoSuffix ;
				
				
				String result = "{" + "\n"+ 
								"	value : '"+line1+"',"+"\n"+ 
								"	text : '"+line1+"'" +"\n"+
								"},";
				
				System.out.println(result);
			}
		}
	}
	
	
}
