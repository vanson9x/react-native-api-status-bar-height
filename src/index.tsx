import { NativeModules, Platform, StatusBar } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-api-status-bar-height' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const ApiStatusBarHeight = NativeModules.ApiStatusBarHeight
  ? NativeModules.ApiStatusBarHeight
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function getStatusBarHeight(): Promise<number> {
  if (Platform.OS === "android") return new Promise(resolve => resolve(StatusBar.currentHeight as number));
  else return ApiStatusBarHeight.getStatusBarHeight();
}
